-- Set a new password for the user 'nate' (must specify the user explicitly)
SET PASSWORD FOR nate = 'newpassword123';

-- Set a new password for the currently logged-in user (no user name needed)
SET PASSWORD = 'newpassword123';

-- Better way (recommended in MySQL 5.7+ and 8.0+)
-- More flexible and preferred for modern MySQL versions
ALTER USER nate IDENTIFIED BY 'newpassword123';
