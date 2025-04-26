USE sql_blog;

-- Bad way to search for keywords: using LIKE is slow, especially on large tables.
-- It cannot use indexes effectively and will scan every row.
SELECT
	*
FROM
	posts
WHERE
	title LIKE '%react redux%'
	OR body LIKE '%react redux%';

-- Better way: use a FULLTEXT index.
-- FULLTEXT indexes allow faster and more advanced text searching.
-- You can search multiple columns at once (like 'title' and 'body').

-- Create a FULLTEXT index on title and body.
-- "IF NOT EXISTS" is not valid syntax in MySQL for FULLTEXT, 
-- so you need to manually check first if it already exists.
-- (Otherwise, this would error if the index already exists.)
CREATE FULLTEXT INDEX idx_title_body ON posts (
	title, body
);

-- Perform a FULLTEXT search.
-- MATCH() AGAINST() scores how relevant each row is to the search query.
-- The 'relivancey_score' column shows how well the row matches.
-- Higher scores mean better matches.
SELECT
	*,
	MATCH(title, body) 
    AGAINST('react redux') AS relivancey_score
FROM
	posts
WHERE
	MATCH(title, body) 
    AGAINST('react -redux +form "handling a form"' IN BOOLEAN MODE);
-- Explanation of BOOLEAN MODE:
--   react           → optional word (normal relevance boost if present)
--   -redux          → must NOT contain 'redux'
--   +form           → must contain 'form'
--   "handling a form" → exact phrase must appear
