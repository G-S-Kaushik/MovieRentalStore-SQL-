use sakila;
show tables;

# Task 1 
select concat(first_name," ",last_name) Full_name from actor;

#Task 2
select first_name , count(first_name) Comman_Names from actor
 group by first_name order by Comman_Names desc;

select first_name  from actor group by first_name having 
count(first_name)=1;

#Task 3
select last_name , count(last_name) Comman_lastnames from actor
 group by last_name order by Comman_lastnames desc;

select last_name  from actor group by last_name having 
count(last_name)=1;

#Task 4
select title from film where rating = 'R';

select title from film where rating != 'R';

select title from film where rating in ('PG-13','G') ;

#Task 5
select title , replacement_cost from film
 where replacement_cost <= 11;

select title , replacement_cost from film 
where replacement_cost between 11 and 20;

select title , replacement_cost from film 
order by replacement_cost desc ;

#Task 6
select title,count(actor_id) Number_actor from film f 
inner join film_actor fa on f.film_id=fa.film_id group by title 
order by Number_actor desc limit 3;

#Task 7
select title from film where title like 'K%' or title like 'Q%';

#Task 8
select concat(first_name," ",last_name) Full_Name from film f 
join film_actor fa on f.film_id=fa.film_id 
join actor a on a.actor_id=fa.actor_id
where title like 'Agent Truman';

#Task 9
select f.title from film f
INNER join film_category fc on f.film_id = fc.film_id
INNER join category c on fc.category_id = c.category_id where c.name = 'Family';

#Task 10
select rating, max(rental_rate) Max_rental_rate,min(rental_rate) Min_rental_rate,
avg(rental_rate) Avg_rental_rate from film group by rating order by Avg_rental_rate desc;

select title,count(rental_id) Rental_Frequency from film f 
INNER join inventory i on f.film_id = i.film_id
 INNER join rental r on r.inventory_id=i.inventory_id
 group by title
 order by  Rental_Frequency desc;

#Task 11
select c.name,avg(rental_rate) Avg_rental, avg(replacement_cost) Avg_replacment 
from film f  inner join film_category fc on f.film_id=fc.film_id
 inner join category c on fc.category_id=c.category_id 
 group by c.name having (Avg_replacment-Avg_rental)> 15 ;

#Task 12
select c.name,count(title) Number_of_Movies from film f 
inner join film_category fc on f.film_id=fc.film_id
 inner join category c on fc.category_id=c.category_id 
 group by c.name having Number_of_Movies> 70 ;



