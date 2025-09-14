-- ======================================================
-- Step 1: Prepare data - split training vs validation
-- ======================================================

-- Drop old tables if they exist
DROP TABLE IF EXISTS public.churn_split,
                    public.churn_train,
                    public.churn_validate CASCADE;

-- Perform an 80/20 train-test split
SELECT madlib.train_test_split(
    'public.train_bank_customer_churn',  -- input
    'public.churn_split',                -- output split table
    0.80,                                -- train fraction
    NULL                                 -- no grouping
);

-- Create training set (80%)
CREATE TABLE public.churn_train AS
SELECT *
FROM public.churn_split
WHERE split = 1
DISTRIBUTED BY (customerid);

-- Create validation set (20%)
CREATE TABLE public.churn_validate AS
SELECT *
FROM public.churn_split
WHERE split = 0
DISTRIBUTED BY (customerid);

-- ======================================================
-- Step 2: Train a decision tree
-- ======================================================

DROP TABLE IF EXISTS public.churn_model, public.churn_model_summary CASCADE;

SELECT madlib.tree_train(
    'public.churn_train',   -- training data
    'public.churn_model',   -- output model
    'customerid',           -- unique ID
    'exited',               -- label column
    'age, balance, complain, creditscore, estimatedsalary, hascrcard, isactivemember, numofproducts, pointsearned, satisfactionscore, tenure',
    NULL::text,             -- no categorical grouping
    'gini'                  -- splitting criterion
);

-- ======================================================
-- Step 3: Predict on validation data
-- ======================================================

DROP TABLE IF EXISTS public.churn_predictions CASCADE;

SELECT madlib.tree_predict(
    'public.churn_model',     -- trained model
    'public.churn_validate',  -- validation data
    'public.churn_predictions', -- output predictions
    'response'
);
