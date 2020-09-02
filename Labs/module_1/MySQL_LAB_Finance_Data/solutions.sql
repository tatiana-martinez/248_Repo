#Challenge 1 - What is the most successful district?
SELECT district_id, count(distinct account_id) As ac_freq 
FROM account
GROUP BY district_id
ORDER BY district_id DESC
LIMIT 5;
#2
SELECT ACCOUNT_ID,COUNT(DISTINCT amount) AS DIFF, GROUP_CONCAT(DISTINCT BANK_TO), GROUP_CONCAT(AMOUNT)
FROM FINANCE1.ORDER
WHERE K_SYMBOL='SIPO'
GROUP BY ACCOUN_ID
HAVING DIFF>1;
/*
*/

#Challenge 3 - Best Selling Districts
SELECT L.ACCOUNT_ID, L.AMOUNT, A.DISTRICT_ID
FROM LOAN L
INNER JOIN ACCOUNT A ON A.ACCOUNT_ID = L.ACCOUNT_ID
ORDER BY L.AMOUNT DESC
LIMIT 5;

#3 - OPTION 1 ELDIAAS
#CREATE TEMPORARY TABLE
#USE MAX (AMOUNT) 

#Challenge 4 - Best Selling Districts UPDATED
SELECT SUM(L.AMOUNT), A.DISTRICT_ID #L.ACCOUNT_ID, 
FROM LOAN L
INNER JOIN ACCOUNT A ON A.ACCOUNT_ID = L.ACCOUNT_ID
GROUP BY A.DISTRICT_ID;
#GROUP BY L.ACCOUNT_ID;
#ORDER BY L.AMOUNT DESC;

#Challenge 5 - Best Selling Districts UPDATED
SELECT AVG(L.AMOUNT) AS MEAN_LAMOUNT, A.DISTRICT_ID  
FROM LOAN L
INNER JOIN ACCOUNT A ON A.ACCOUNT_ID = L.ACCOUNT_ID
GROUP BY A.DISTRICT_ID;

SELECT (SUM(L.AMOUNT))/(LENGTH(L.AMOUNT)) AS MEAN_LAMOUNT, A.DISTRICT_ID
FROM LOAN L
INNER JOIN ACCOUNT A ON A.ACCOUNT_ID = L.ACCOUNT_ID
GROUP BY A.DISTRICT_ID;


#SOL
SELECT x.district_id, x.amount, count(y.amount) as ranking
from xxx x, xxx y
where x.district_id=y.district_id and x.amount<y.amount
group by x.district_id, x.amount
order by 1,2 desc

create table xxx
select l.account_id, district_id, amount
from account a
inner join loan l on a.account_id=l.account_id;

select district_id, amount
from (
SELECT x.district_id, x.amount, count(y.amount) as ranking
from xxx x, xxx y
where x.district_id=y.district_id and x.amount<y.amount
group by x.district_id, x.amount) as ranked_table
where exists(
	select x1.district_id, ceil(count(x1.amount)/2) ranking
	from xxx x1
	group by district_id
    having ranked_table.district_id = x1.district_id and ranked_table.ranking=ranking)
order by 2 desc
limit 5;
