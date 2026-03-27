-- =========================================
-- SQL FUNCTIONS PRACTICE FILE
-- Author: Muhammad Hasnat Imtiaz
-- =========================================


-- =========================
-- 🔹 STRING FUNCTIONS
-- =========================

-- LOWER
SELECT LOWER('HELLO WORLD') AS lower_text;

-- UPPER
SELECT UPPER('hello world') AS upper_text;

-- INITCAP (Oracle)
SELECT INITCAP('hello world') AS initcap_text;

-- CONCAT
SELECT CONCAT('Hello', ' World') AS concatenated_text;

-- SUBSTR / SUBSTRING
SELECT SUBSTR('Pakistan', 1, 4) AS substr_text;
SELECT SUBSTRING('Database', 1, 4) AS substring_text;

-- LENGTH
SELECT LENGTH('Hello') AS length_text;

-- CHAR_LENGTH
SELECT CHAR_LENGTH('Hello') AS char_length_text;

-- INSTR
SELECT INSTR('Pakistan', 'stan') AS instr_position;

-- LPAD
SELECT LPAD('123', 5, '0') AS lpad_text;

-- RPAD
SELECT RPAD('123', 5, '0') AS rpad_text;

-- TRIM
SELECT TRIM('   Hello   ') AS trimmed_text;

-- REPLACE
SELECT REPLACE('Hello World', 'World', 'SQL') AS replaced_text;


-- =========================
-- 🔢 NUMBER FUNCTIONS
-- =========================

-- ROUND
SELECT ROUND(123.456, 2) AS rounded_value;

-- TRUNC (Oracle)
SELECT TRUNC(123.456, 2) AS truncated_value;

-- MOD
SELECT MOD(10, 3) AS remainder;


-- =========================
-- 📅 DATE FUNCTIONS
-- =========================

-- Current Date & Time
SELECT GETDATE() AS current_datetime;     -- SQL Server
SELECT SYSDATE AS current_datetime_oracle; -- Oracle

-- DATEPART
SELECT DATEPART(YEAR, GETDATE()) AS current_year;

-- DATEADD
SELECT DATEADD(DAY, 5, GETDATE()) AS date_after_5_days;

-- DATEDIFF
SELECT DATEDIFF(DAY, '2025-01-01', '2025-01-10') AS days_difference;

-- CONVERT (format date)
SELECT CONVERT(VARCHAR, GETDATE(), 103) AS formatted_date;


-- =========================
-- 📅 DATE ARITHMETIC
-- =========================

-- Add days
SELECT SYSDATE + 5 AS add_days;

-- Subtract dates
SELECT TO_DATE('2025-01-10','YYYY-MM-DD') - 
       TO_DATE('2025-01-01','YYYY-MM-DD') AS date_diff;

-- Add hours
SELECT SYSDATE + (5/24) AS add_hours;


-- =========================
-- 🔄 CONVERSION FUNCTIONS
-- =========================

-- CAST
SELECT CAST(123.45 AS INT) AS cast_value;

-- CONVERT
SELECT CONVERT(INT, 123.45) AS convert_value;


-- =========================
-- 🔁 NESTING FUNCTION
-- =========================

SELECT UPPER(SUBSTRING('hello world', 1, 5)) AS nested_result;


-- =========================
-- ⚠️ NULL FUNCTIONS
-- =========================

-- ISNULL
SELECT ISNULL(NULL, 'Default Value') AS isnull_result;

-- COALESCE
SELECT COALESCE(NULL, NULL, 'First Non-Null', 'Second') AS coalesce_result;


-- =========================
-- 🔀 CASE EXPRESSIONS
-- =========================

-- CASE (searched)
SELECT 
    CASE 
        WHEN 6000 > 5000 THEN 'High Salary'
        ELSE 'Low Salary'
    END AS salary_status;

-- CASE (simple)
SELECT 
    CASE 2
        WHEN 1 THEN 'HR'
        WHEN 2 THEN 'IT'
        ELSE 'Other'
    END AS department_name;


-- =========================================
-- END OF FILE
-- =========================================
