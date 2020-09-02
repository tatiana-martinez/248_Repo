#challenge1
#step1
SELECT t.title_id AS Title_ID,
au_id As Author_ID,
(t.advance * ta.royaltyper / 100) AS Advance,
(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS Royalty
FROM titles t
INNER JOIN titleauthor ta ON t.title_id = ta.title_id
INNER JOIN sales s ON t.title_id = s.title_id;

#step2
SELECT Title_ID, Author_ID, SUM(Royalty)
FROM (
		SELECT t.title_id AS Title_ID,
		au_id As Author_ID,
		(t.advance * ta.royaltyper / 100) AS Advance,
		(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS Royalty
		FROM titles t
		INNER JOIN titleauthor ta ON t.title_id = ta.title_id
		INNER JOIN sales s ON t.title_id = s.title_id
) As step1
GROUP BY Title_ID, Author_ID;

#step3
SELECT Author_ID,SUM(Advance), SUM(Royalty)
FROM (
		SELECT Title_ID, Author_ID, SUM(Royalty) AS Royalty, Advance
		FROM (
				SELECT t.title_id AS Title_ID,
				au_id As Author_ID,
				(t.advance * ta.royaltyper / 100) AS Advance,
				(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS Royalty
				FROM titles t
				INNER JOIN titleauthor ta ON t.title_id = ta.title_id
				INNER JOIN sales s ON t.title_id = s.title_id
		) As step1	
		GROUP BY Title_ID, Author_ID) As step2
GROUP BY Author_ID;

#challenge2
CREATE TEMPORARY TABLE publications.step1
SELECT t.title_id AS Title_ID,
au_id As Author_ID,
(t.advance * ta.royaltyper / 100) AS Advance,
(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS Royalty
FROM titles t
INNER JOIN titleauthor ta ON t.title_id = ta.title_id
INNER JOIN sales s ON t.title_id = s.title_id;

SELECT Title_ID, Author_ID, SUM(Royalty)
FROM step1
GROUP BY Title_ID, Author_ID;

CREATE TEMPORARY TABLE publications.step2
SELECT Title_ID, Author_ID, SUM(Royalty) AS Royalty, Advance
FROM step1
GROUP BY Title_ID, Author_ID,Advance;

SELECT Author_ID,SUM(Advance), SUM(Royalty)
FROM step2
GROUP BY Author_ID;

#challenge3
CREATE TEMPORARY TABLE publications.step3
SELECT Author_ID,SUM(Advance) As SAvance, SUM(Royalty) As SRoyalty
FROM step2
GROUP BY Author_ID;

SELECT * FROM step3;

SELECT Author_ID,
(SAvance +SRoyalty) As profits
FROM step3
ORDER BY profits DESC
LIMIT 3;

CREATE TABLE most_profiting_authors
SELECT Author_ID,
(SAvance +SRoyalty) As profits
FROM step3
ORDER BY profits DESC
LIMIT 3;

SELECT * FROM most_profiting_authors;

