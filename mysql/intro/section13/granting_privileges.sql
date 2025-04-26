-- 1: Web/Desktop application
CREATE USER moon_app IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON sql_store.* TO moon_app;

-- 2: Admin
GRANT ALL ON *.* TO nate;

-- 3: Read-only reporting user
-- Only needs to read data, no changes allowed
CREATE USER report_user IDENTIFIED BY 'password123';
GRANT SELECT ON sql_store.* TO report_user;

-- 4: Backup user
-- Only needs SELECT and LOCK TABLES to perform backups
CREATE USER backup_user IDENTIFIED BY 'password123';
GRANT SELECT, LOCK TABLES ON *.* TO backup_user;

-- 5: Read/Write on one database, no access to others
CREATE USER orders_manager IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE ON sql_orders.* TO orders_manager;

-- 6: Developer user (limited dev permissions, no drop tables)
CREATE USER dev_user IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, INDEX, ALTER ON dev_db.* TO dev_user;

-- 7: Superuser but without GRANT OPTION (can't create users)
CREATE USER supervisor IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON *.* TO supervisor;

-- 8: Web read-only app user (frontend-only app needs just SELECT)
CREATE USER web_reader IDENTIFIED BY 'password123';
GRANT SELECT ON sql_store.* TO web_reader;
