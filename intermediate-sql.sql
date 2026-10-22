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


-- ==========================================
-- NOTE: COUNT() WITH WHERE
-- ==========================================

-- PURPOSE:
-- Count the records with at least 100,000 votes.

SELECT COUNT(num_votes) AS films_over_100k_votes
FROM reviews
WHERE num_votes >= 100000;


-- ==========================================
-- NOTE: BETWEEN OPERATOR
-- ==========================================

-- PURPOSE:
-- Select films released between 1990 and 2000.

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;


-- ==========================================
-- NOTE: SQL FILTERING OPERATORS
-- ==========================================

-- AND
-- Both conditions must be TRUE.

-- OR
-- At least one condition must be TRUE.

-- BETWEEN
-- Checks whether a value falls within a range.
-- Includes both the lower and upper boundaries.

-- LIKE
-- Searches for a specific pattern in text.

-- NOT LIKE
-- Finds text values that do not match a pattern.

-- IN
-- Checks whether a value matches any value in a list.

-- NOT IN
-- Checks whether a value is not included in a list.

-- ==========================================
-- NOTE: LIKE WILDCARDS
-- ==========================================

-- % = Matches zero or more characters.
-- _ = Matches exactly one character.

-- ==========================================
-- IMPORTANT REMINDERS
-- ==========================================

-- AND and OR combine multiple conditions.
-- Use parentheses to control condition evaluation.
-- BETWEEN includes both boundary values.
-- LIKE case sensitivity depends on the SQL database.
-- Comparisons involving NULL do not evaluate to TRUE.


-- ==========================================
-- NOTE: AVG() AND ROUND()
-- ==========================================

-- AVG() calculates the average value.
-- ROUND(value, 2) rounds to 2 decimal places.
-- WHERE filters records based on a condition.
-- AS assigns an alias to the result column.

SELECT ROUND(AVG(budget), 2) AS avg_budget
FROM films
WHERE release_year >= 2010;

-- ROUND(value, 0) rounds to 0 decimal places (whole number).

SELECT ROUND(AVG(budget), 0) AS avg_budget
FROM films
WHERE release_year >= 2010;

-- Interpretation: Calculates the average budget of films
-- released in 2010 or later, rounded to a whole number.


-- ==========================================
-- NOTE: ARITHMETIC OPERATIONS
-- ==========================================

-- Subtraction (-) subtracts one value from another.
-- AS assigns an alias to the result column.

SELECT (gross - budget) AS profit
FROM films;

-- Interpretation: Calculates film profit by subtracting
-- budget from gross revenue.


-- ==========================================
-- NOTE: COUNT() AND PERCENTAGES
-- ==========================================

SELECT COUNT(deathdate) * 100.0 / COUNT(people) AS percentage_dead
FROM people;

-- COUNT(deathdate) counts non-NULL death dates.
-- COUNT(people) counts non-NULL values in the people column.
-- Multiply by 100.0 to calculate the percentage.


-- ==========================================
-- NOTE: CALCULATING DECADES
-- ==========================================

-- MAX() returns the latest release year.
-- MIN() returns the earliest release year.
-- Subtraction finds the difference between the years.
-- Divide by 10.0 to express the time span in decades.

SELECT (MAX(release_year) - MIN(release_year)) / 10.0
    AS number_of_decades
FROM films;

-- Interpretation: Calculates the time span between the
-- earliest and latest film release years in decades.


-- ==========================================
-- NOTE: ROUND() AND ALIASES
-- ==========================================

-- ROUND(value, 2) rounds a value to two decimal places.
-- Divide duration by 60.0 to convert minutes to hours.
-- AS assigns a name to the result column.

SELECT title, ROUND(duration / 60.0, 2) AS duration_hours
FROM films;

-- Interpretation: Displays each film's title and duration
-- in hours, rounded to two decimal places.
