-- Create a user 'nate' that can connect from any host (% wildcard by default)
CREATE USER nate;

-- Create a user 'nate' that can only connect from the IP address 127.0.0.1
CREATE USER nate@127.0.0.1;

-- Create a user 'nate' that can only connect from the localhost (same machine)
CREATE USER nate@localhost;

-- Create a user 'nate' that can connect from any subdomain under 'codewithmosh.com'
CREATE USER nate@'%.codewithmosh.com';

-- Create a user 'nate' with a password (for the default host %)
CREATE USER nate IDENTIFIED BY 'password123';
