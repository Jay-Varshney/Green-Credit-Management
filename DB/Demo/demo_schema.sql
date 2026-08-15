CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;

DROP TYPE IF EXISTS silver.green_type_enum CASCADE;
DROP TYPE IF EXISTS silver.request_status_enum CASCADE; 
-- Custom ENUM Types 
CREATE TYPE silver.green_type_enum AS ENUM (
    'Tree Planting', 
    'Solar Installation', 
    'Waste Reduction', 
    'Energy Conservation'
);

CREATE TYPE silver.request_status_enum AS ENUM (
    'Pending', 
    'Approved', 
    'Expired', 
    'Rejected'
);


-- Silver Layer

-- 1. Department Table
CREATE TABLE silver.department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- 2. Role Table
CREATE TABLE silver.role (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- 3. User Table
CREATE TABLE silver.user (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    dept_id INT REFERENCES silver.department(dept_id),
    role_id INT REFERENCES silver.role(role_id)
);

-- 4. Credit Transaction Table
CREATE TABLE silver.credit_transaction (
    trans_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES silver.user(user_id), 
    dept_id INT REFERENCES silver.department(dept_id),
    credit NUMERIC(12, 2) DEFAULT 0.00,
    debit NUMERIC(12, 2) DEFAULT 0.00,
    green_type silver.green_type_enum NOT NULL,
	evidence_url TEXT,
	description TEXT,
    date_of_creation TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    req_status silver.request_status_enum DEFAULT 'Pending',
    approved_rejected_by INT REFERENCES silver.user(user_id),
	status_update_date TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- Gold Layer

CREATE OR REPLACE VIEW gold.processed_credit_transactions AS
SELECT 
    trans_id,
    user_id,
    dept_id,
    credit,
    debit,
    green_type,
    description,
    evidence_url,
    req_status,
    date_of_creation,
    approved_rejected_by,
    status_update_date
FROM silver.credit_transaction
WHERE req_status != 'Pending';




