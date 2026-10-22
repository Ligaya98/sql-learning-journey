
-- ==========================================
-- PROJECT: JOINING DATA IN SQL
-- ==========================================

-- INNER JOIN combines rows with matching values in both tables.
-- ON specifies the condition used to match rows between tables.
-- Table aliases shorten table names and improve readability.
-- AS assigns an alias to a table.
-- p1 refers to the presidents table.
-- p2 refers to the prime_ministers table.
-- USING(country) joins tables using a shared column named country.
-- ON and USING can specify the join condition.
-- AS is used for aliases, not as a join condition.

-- ==========================================
-- 1. INNER JOIN USING ON
-- ==========================================

SELECT
    prime_ministers.country,
    prime_ministers.continent,
    prime_minister,
    president
FROM presidents
INNER JOIN prime_ministers
    ON presidents.country = prime_ministers.country;

-- Interpretation:
-- Combines presidents and prime ministers by country.
-- Returns only countries that have matching records
-- in both tables.

-- ==========================================
-- 2. INNER JOIN USING TABLE ALIASES
-- ==========================================

SELECT
    p2.country,
    p2.continent,
    prime_minister,
    president
FROM presidents AS p1
INNER JOIN prime_ministers AS p2
    ON p1.country = p2.country;

-- Interpretation:
-- Produces the same matching results as the first query.
-- Uses p1 and p2 as shorter table names to improve
-- readability and simplify column references.

-- ==========================================
-- 3. INNER JOIN USING USING()
-- ==========================================

SELECT
    p2.country,
    p2.continent,
    prime_minister,
    president
FROM presidents AS p1
INNER JOIN prime_ministers AS p2
    USING(country);

-- Interpretation:
-- Matches countries using the shared country column.
-- USING(country) is a shorter alternative to
-- ON p1.country = p2.country when both tables have
-- a column named country.
