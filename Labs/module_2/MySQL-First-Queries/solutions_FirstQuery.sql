#1. What are the different genres? 23 prime_genre
select distinct(prime_genre) from Appstore;

#2. Which is the genre with the most apps rated? Social Networking is the genre of Apps with the most apps rated
SELECT prime_genre, count(rating_count_tot) 
FROM Appstore
GROUP BY prime_genre
LIMIT 1;

#3. Which is the genre with most apps? Games app is the genre with most apps
select prime_genre, count(id)
from Appstore
GROUP BY prime_genre
ORDER BY count(id) DESC
LIMIT 1;

select prime_genre, count(id)
from Appstore
GROUP BY prime_genre
ORDER BY 2 DESC
LIMIT 1;

select prime_genre, count(id) as cid
from Appstore
GROUP BY prime_genre
ORDER BY cid DESC
LIMIT 1;

#4 Which is the one with least? Catalogs is the genre with least apps
select prime_genre, count(id)
from Appstore
GROUP BY prime_genre
ORDER BY count(id) ASC
LIMIT 1;
#in case of several id
select prime_genre, count(distinct(id))
from Appstore
GROUP BY prime_genre
ORDER BY count(id) ASC
LIMIT 1;

#5. Find the top 10 apps most rated. Facebook,.
select *
from Appstore
ORDER BY rating_count_tot DESC
LIMIT 10;

#6. Find the top 10 apps best rated by users.
select *
from Appstore
ORDER BY user_rating DESC
LIMIT 10;

#7.Take a look at the data you retrieved in question 5. Give some insights - top 10 Apps
#All the Apps are free

#8.Take a look at the data you retrieved in question 6. Give some insights - top 10 Apps best rated by users
#Most of them are really highly rated,the total rating count is not always high

#9. Now compare the data from questions 5 and 6. What do you see?

#10. How could you take the top 3 regarding both user ratings and number of votes?
select * from Appstore
order by user_rating DESC, rating_count_tot DESC
LIMIT 3;

#11. Do people care about the price of an app?
select avg(rating_count_tot) from Appstore where price =0;
select avg(rating_count_tot) from Appstore where price !=0;

select avg(user_rating) from Appstore where price =0;
select avg(user_rating from Appstore where price !=0;

select max(user_rating), min(user_rating) from Appstore where price =0;

select max(user_rating), min(user_rating) from Appstore where price !=0;