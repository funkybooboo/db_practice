-- See all available character sets
SHOW CHARACTER SET;

-- See available collations for a character set
SHOW COLLATION WHERE Charset = 'latin1';

-- Create a database using utf8mb4 (recommended today)
CREATE DATABASE IF NOT EXISTS my_learning_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE my_learning_db;

-- Create a table that uses utf8mb4
CREATE TABLE IF NOT EXISTS messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(255) NOT NULL
)
CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci;
