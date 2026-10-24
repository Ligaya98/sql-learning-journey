
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


-- ==========================================
-- 4. CROSS JOIN
-- ==========================================

SELECT
    c.name AS country,
    l.name AS language
FROM countries AS c
CROSS JOIN languages AS l
WHERE c.code IN ('PAK', 'IND')
    AND l.code IN ('PAK', 'IND');

-- Interpretation:
-- Combines every selected country with every selected language.
-- CROSS JOIN does not require a join key or join condition.
-- WHERE filters the countries and languages before returning
-- the resulting combinations.
-- 2 countries × 2 languages = 4 combinations.
-- Do not use ON or USING() with CROSS JOIN.


-- ==========================================
-- 8. SUBQUERIES
-- ==========================================

SELECT *
FROM populations
WHERE year = 2015
-- Filter for populations where life expectancy
-- is more than 1.15 times the average
    AND life_expectancy > 1.15 *
    (SELECT AVG(life_expectancy)
     FROM populations
     WHERE year = 2015);

-- Interpretation:
-- The subquery calculates the average life expectancy
-- across all population records for 2015.
-- AVG(life_expectancy) returns the average value.
-- Multiplying the average by 1.15 sets a threshold
-- that is 15% higher than the average.
-- The outer query returns only records from 2015
-- whose life expectancy exceeds that threshold.


-- ==========================================
-- 11. CORRELATED SUBQUERY TO COUNT CITIES
-- ==========================================

SELECT
    countries.name AS country,
    -- Subquery that provides the count of cities
    (SELECT COUNT(*)
     FROM cities
     WHERE cities.country_code = countries.code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- Interpretation:
-- The outer query retrieves each country's name.
-- The correlated subquery counts cities belonging
-- to the current country.
-- WHERE cities.country_code = countries.code matches
-- the country codes in both tables.
-- COUNT(*) counts all matching city records.
-- Countries with no matching cities receive a count of 0.
-- ORDER BY cities_num DESC ranks countries from most
-- cities to fewest.
-- country sorts alphabetically when counts are tied.
-- LIMIT 9 returns the top nine countries.


-- ==========================================
-- 13. SUBQUERY IN FROM (DERIVED TABLE)
-- ==========================================

-- Select local_name and lang_num from appropriate tables

SELECT
    countries.local_name,
    sub.lang_num
FROM countries,
    (SELECT code, COUNT(*) AS lang_num
     FROM languages
     GROUP BY code) AS sub
-- Where codes match
WHERE countries.code = sub.code
ORDER BY lang_num DESC;

-- Interpretation:
-- The subquery counts the number of language records
-- for each country code.
-- GROUP BY code calculates the count for each code.
-- AS lang_num assigns an alias to the calculated count.
-- AS sub assigns an alias to the subquery, allowing
-- the outer query to reference its columns.
-- WHERE countries.code = sub.code matches countries
-- with their corresponding language counts.
-- ORDER BY lang_num DESC sorts countries from the
-- highest language count to the lowest.

-- Key Takeaway:
-- A subquery in the FROM clause acts like a temporary table.
-- It must have an alias, such as sub.
-- WHERE can match records between the original table
-- and the derived table.


-- ==========================================
-- 16. SUBQUERY WITH IN, LIKE, AND NULL FILTERING
-- ==========================================

-- Select cities that are capitals in Europe or the Americas
SELECT
    name,
    country_code,
    city_proper_pop,
    metroarea_pop,
    (city_proper_pop / metroarea_pop * 100) AS city_perc
FROM cities
-- Use subquery to filter city names
WHERE name IN (
    SELECT capital
    FROM countries
    WHERE continent = 'Europe'
        OR continent LIKE '%America'
)
-- Exclude NULL metro area population values
AND metroarea_pop IS NOT NULL
-- Sort and limit the result
ORDER BY city_perc DESC
LIMIT 10;

-- Interpretation:
-- The outer query retrieves city names, country codes,
-- city proper populations, and metro area populations.
-- city_perc calculates the city proper population as
-- a percentage of the metro area population.
-- The subquery retrieves capital cities from countries
-- in Europe or continents whose names end in 'America'.
-- IN checks whether each city name matches a capital
-- returned by the subquery.
-- continent = 'Europe' matches Europe exactly.
-- continent LIKE '%America' matches continent names
-- ending in 'America', such as North America and South America.
-- IS NOT NULL excludes cities with missing metro area
-- population values.
-- ORDER BY city_perc DESC sorts from highest percentage
-- to lowest.
-- LIMIT 10 returns only the top 10 results.

-- Key Takeaways:
-- IN (subquery) filters values using a list returned
-- by another query.
-- LIKE '%text' matches values ending with the specified text.
-- IS NOT NULL excludes missing values.
-- DESC sorts values in descending order.
