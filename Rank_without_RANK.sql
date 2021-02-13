-- Rank without RANK 

-- Write a query to rank scores in the following table without using a window function. 
-- If there is a tie between two scores, both should have the same rank. 
-- After a tie, the following rank should be the next consecutive integer value. 

create database if not exists practicedb;
use practicedb;

create table if not exists scores (
id integer not null, 
score decimal(3,2));
/*
insert into scores (id, score)
VALUES
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);
*/
select * from scores;
-- select *from scores s1 join scores s2 on s1.score<=s2.score order by s1.id desc;
select * , count(distinct s2.score) as dis from scores s1 
join scores s2 
on s1.score <= s2.score 
group by s1.id,s1.score 
order by s1.score desc;  

