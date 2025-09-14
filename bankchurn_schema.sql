--
-- Name: bank_customer_churn; Type: TABLE; Schema: public; Owner: gpadmin
--

CREATE TABLE public.bank_customer_churn (
    rownumber integer,
    customerid bigint,
    surname text,
    creditscore integer,
    geography text,
    gender text,
    age integer,
    tenure integer,
    balance numeric(18,2),
    numofproducts integer,
    hascrcard integer,
    isactivemember integer,
    estimatedsalary numeric(18,2),
    exited integer,
    complain integer,
    satisfactionscore integer,
    cardtype text,
    pointsearned integer
) DISTRIBUTED BY (customerid);


ALTER TABLE public.bank_customer_churn OWNER TO gpadmin;

--
-- Name: test_bank_customer_churn; Type: TABLE; Schema: public; Owner: gpadmin
--

CREATE TABLE public.test_bank_customer_churn (
    rownumber integer,
    customerid bigint,
    surname text,
    creditscore integer,
    geography text,
    gender text,
    age integer,
    tenure integer,
    balance numeric(18,2),
    numofproducts integer,
    hascrcard integer,
    isactivemember integer,
    estimatedsalary numeric(18,2),
    exited integer,
    complain integer,
    satisfactionscore integer,
    cardtype text,
    pointsearned integer
) DISTRIBUTED RANDOMLY;


ALTER TABLE public.test_bank_customer_churn OWNER TO gpadmin;

--
-- Name: train_bank_customer_churn; Type: TABLE; Schema: public; Owner: gpadmin
--

CREATE TABLE public.train_bank_customer_churn (
    rownumber integer,
    customerid bigint,
    surname text,
    creditscore integer,
    geography text,
    gender text,
    age integer,
    tenure integer,
    balance numeric(18,2),
    numofproducts integer,
    hascrcard integer,
    isactivemember integer,
    estimatedsalary numeric(18,2),
    exited integer,
    complain integer,
    satisfactionscore integer,
    cardtype text,
    pointsearned integer
) DISTRIBUTED RANDOMLY;


ALTER TABLE public.train_bank_customer_churn OWNER TO gpadmin;
