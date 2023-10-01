-- 1
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    LOWER(first_name) LIKE 'sa%';


-- 2
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    LOWER(last_name) LIKE '%ei%';
    
    
-- 3
SELECT 
    first_name
FROM
    employees
WHERE
    department_id IN (3 , 10)
        AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id ASC;

-- 4

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    LOWER(job_title) NOT LIKE '%engineer%'
ORDER BY employee_id;

-- 5

SELECT 
    `name`
FROM
    `towns`
WHERE
    LENGTH(`name`) = 5 OR LENGTH(`name`) = 6
    ORDER BY `name` ASC;
    
-- 6

SELECT 
    *
FROM
    towns
WHERE
    LOWER(name) LIKE 'm%'
        OR LOWER(name) LIKE 'k%'
        OR LOWER(name) LIKE 'b%'
        OR LOWER(name) LIKE 'e%'
ORDER BY name ASC;

-- 7


SELECT 
    *
FROM
    towns
WHERE
    name REGEXP '^[^RrBbDd]'
ORDER BY name ASC;


-- 8
CREATE VIEW v_employees_hired_after_2000 AS
    SELECT 
        first_name, last_name
    FROM
        employees
    WHERE
        YEAR(hire_date) > 2000;

-- 9
SELECT first_name, last_name
FROM employees

WHERE
char_length(last_name) = 5;


-- 10

SELECT country_name, iso_code
FROM countries
WHERE 
	(char_length(country_name) - char_length(replace(lower(country_name), 'a', ''))) >= 3
    ORDER BY iso_code asc;
    
-- 11

SELECT 
    p.peak_name,
    r.river_name,
    LOWER(CONCAT(LEFT(p.peak_name,
                        LENGTH(p.peak_name) - 1),
                    r.river_name)) AS mix
FROM
    rivers AS r,
    peaks AS p
WHERE
    UPPER(RIGHT(p.peak_name, 1)) = UPPER(LEFT(r.river_name, 1))
ORDER BY mix;

-- 12

SELECT 
    `name`, DATE_FORMAT(`start`, '%Y-%m-%d') AS `start`
FROM
    `games`
    WHERE  YEAR (`start`) IN (2011, 2012)
    ORDER BY `start`, `name`
    LIMIT 50;

-- 13

SELECT 
    user_name,
    SUBSTRING_INDEX(email, '@', - 1) AS `email provider`
FROM
    users
ORDER BY `email provider` , user_name;

-- или:

SELECT 
    user_name,
    REGEXP_REPLACE(email, '.*@', '') AS `email provider`
    FROM users
    ORDER BY `email provider`, user_name;

-- 14
SELECT user_name, ip_address
FROM users
WHERE (ip_address) LIKE '___.1%.%.___'
ORDER BY user_name;

-- 15
SELECT 
    name AS games,
    CASE
        WHEN HOUR(start) BETWEEN 0 AND 11 THEN 'Morning'
        WHEN HOUR(start) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS 'Part of the Day',
    CASE
        WHEN duration <= 3 THEN 'Extra Short'
        WHEN duration BETWEEN 4 AND 6 THEN 'Short'
        WHEN duration BETWEEN 7 AND 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM
    games;

-- 16

SELECT 
    product_name,
    order_date,
    DATE_ADD(order_date, INTERVAL 3 DAY) AS pay_due,
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS deliver_due
FROM
    orders;
    



