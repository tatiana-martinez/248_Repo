#challenge1
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', t.title as 'TITLE', p.pub_name as 'PUBLISHER'

from authors a

inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on p.pub_id = t.pub_id;

#challenge2
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', p.pub_name as 'PUBLISHER', count(t.title) as 'TITLE COUNT'

from authors a

inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on p.pub_id = t.pub_id

group by a.au_id,p.pub_name;

#challenge3
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', count(t.title) as 'TOTAL' 

from authors a

inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join sales s on s.title_id = t.title_id

group by a.au_id
order by count(t.title) desc limit 3;


#challenge4
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', count(t.title) as 'TOTAL' 

from authors a

left join titleauthor ta on a.au_id = ta.au_id
left join titles t on ta.title_id = t.title_id
left join sales s on s.title_id = t.title_id

group by a.au_id
order by count(t.title) desc;


