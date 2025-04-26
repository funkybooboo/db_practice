-- Bob joins the team: create a new user 'bob' who can connect only from localhost
CREATE USER bob@localhost IDENTIFIED BY '123';

-- Bob leaves the team: remove the 'bob' user from localhost
DROP USER bob@localhost;
