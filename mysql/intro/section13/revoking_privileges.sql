-- Grant 'moon_app' permission to create views in the 'sql_store' database
GRANT CREATE VIEW ON sql_store.* TO moon_app;

-- Revoke (remove) the CREATE VIEW permission from 'moon_app'
REVOKE CREATE VIEW ON sql_store.* FROM moon_app;
