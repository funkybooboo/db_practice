-- Create a new database only if it doesn't already exist
CREATE DATABASE IF NOT EXISTS mynewdatabase;

-- Delete the database if it already exists (useful for resetting during development)
DROP DATABASE IF EXISTS mynewdatabase;
