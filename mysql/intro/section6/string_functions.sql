-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html
SELECT LENGTH('sky'); -- 3

SELECT LOWER('sky'); -- sky

SELECT UPPER('sky'); -- SKY

SELECT LTRIM('   sky'); -- sky

SELECT RTRIM('sky   '); -- sky

SELECT TRIM('    sky     '); -- sky

SELECT LEFT('Kindergarten', 4); -- Kind

SELECT RIGHT('Kindergarten', 6); -- garten

SELECT SUBSTRING('Kindergarten', 3, 5); -- nderg
SELECT SUBSTRING('Kindergarten', 3); -- ndergarten

SELECT LOCATE('n', 'Kindergarten'); -- 3
SELECT LOCATE('q', 'Kindergarten'); -- 0
SELECT LOCATE('garten', 'Kindergarten'); -- 7

SELECT REPLACE('Kindergarten', 'garten', 'garden'); -- Kindergarden

SELECT CONCAT('first', ' last'); -- first last

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM sql_store.customers;

