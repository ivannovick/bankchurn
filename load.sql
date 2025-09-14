-- Data source: https://www.kaggle.com/datasets/radheshyamkollipara/bank-customer-churn
COPY bank_customer_churn
FROM '/home/gpadmin/madlib-2.2.0-gp7-el8-x86_64/Customer-Churn-Records.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    NULL '',
    QUOTE '"'
);
