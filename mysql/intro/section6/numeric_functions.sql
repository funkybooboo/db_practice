-- https://dev.mysql.com/doc/refman/8.0/en/numeric-functions.html
SELECT ROUND(5.7375, 2); -- 5.74

SELECT TRUNCATE(5.7375, 2); -- 5.73

SELECT CEILING(5.7); -- 6
SELECT CEILING(5.2); -- 6

SELECT FLOOR(5.7); -- 5
SELECT FLOOR(5.2); -- 5

SELECT ABS(5.7); -- 5.7
SELECT ABS(-5.7); -- 5.7

SELECT RAND(); -- [0, 1]
