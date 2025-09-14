DROP TABLE IF EXISTS public.churn_predictions_all;

SELECT madlib.tree_predict(
    'public.churn_model',           -- trained model
    'public.bank_customer_churn',   -- all data
    'public.churn_predictions_all', -- output table
    'response'
);

SELECT 
    b.exited AS actual,
    p.estimated_exited AS predicted,
    COUNT(*) AS count
FROM bank_customer_churn b
JOIN churn_predictions_all p
  ON b.customerid = p.customerid
GROUP BY b.exited, p.estimated_exited
ORDER BY actual, predicted;
