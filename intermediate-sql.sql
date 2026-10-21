-- Count the number of unique countries in the films table
SELECT COUNT(DISTINCT country) AS count_distinct_country
FROM films;


-- ==========================================
-- NOTE: COLUMN NAMES WITH SPACES
-- ==========================================

-- Use double quotes around column names containing
-- spaces when supported by your SQL dialect.

-- Example:
SELECT "release year"
FROM films;


-- ==========================================
-- NOTE: CREATE VIEW
-- ==========================================

-- EXAMPLE:
CREATE VIEW employee_hire_years AS
SELECT id, name, year_hired
FROM employees;

SELECT id, name
FROM employee_hire_years;


-- ==========================================
-- NOTE: SQL COMPARISON OPERATORS
-- ==========================================

-- Comparison operators compare two values.
-- They are commonly used in the WHERE clause
-- to filter records based on a condition.

-- =   Equal to
-- <>  Not equal to
-- >   Greater than
-- <   Less than
-- >=  Greater than or equal to
-- <=  Less than or equal to


-- EXAMPLES:

-- 1. Equal to
SELECT *
FROM films
WHERE country = 'USA';

-- 2. Not equal to
SELECT *
FROM films
WHERE country <> 'USA';

-- 3. Greater than
SELECT *
FROM films
WHERE budget > 1000000;

-- 4. Less than
SELECT *
FROM films
WHERE budget < 1000000;

-- 5. Greater than or equal to
SELECT *
FROM films
WHERE budget >= 1000000;

-- 6. Less than or equal to
SELECT *
FROM films
WHERE budget <= 1000000;
