-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html
DATE_FORMAT(NOW(), '%y') -- 25
DATE_FORMAT(NOW(), '%Y') -- 2025

DATE_FORMAT(NOW(), '%m %Y') -- 03 2025
DATE_FORMAT(NOW(), '%M %d %Y') -- March 11 2025

DATE_FORMAT(NOW(), '%H:%i %p') -- 12:58 PM
