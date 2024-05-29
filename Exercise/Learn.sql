#Cross join
select * from 
food_db.items cross join variants;

select *, concat(variant_name, " | ", name) as full_name, (price + variant_price) as total_price from 
food_db.items cross join variants;

select movies.movie_id, title, industry, budget, revenue, unit, currency, 
case
when unit = 'thousands' then round((revenue - budget)/1000, 2)
when unit = 'billions' then round((revenue - budget)*1000, 2)
else round((revenue-budget), 2)
end as profit_millions
from movies join financials on
movies.movie_id = financials.movie_id
where industry = 'bollywood'
order by profit_millions desc;

#Join two or more tables
# group_concat()
select 
movies.movie_id, movies.title, group_concat(actors.name) as actors, industry
from movies 
join movie_actor on movies.movie_id=movie_actor.movie_id
join actors on movie_actor.actor_id=actors.actor_id
group by movies.movie_id;

select actors.name, group_concat(movies.title) as movie_title, count(movies.title) as movie_count
from actors  
join movie_actor on actors.actor_id=movie_actor.actor_id
join movies on movie_actor.movie_id = movies.movie_id
group by actors.name
order by movie_count desc;

#----------------------------------------------------------------------------------------------------------------------

# Subqueries
select * from movies order by imdb_rating desc limit 1;
#Scenario-1 ------> Subquery returns a single value
select * from movies where imdb_rating = (select max(imdb_rating) from movies);
select * from movies where imdb_rating = (select min(imdb_rating) from movies);
#Scenario-2 -----> Subquery returns a list of values 
select * from movies where imdb_rating 
in ((select max(imdb_rating) from movies), (select min(imdb_rating) from movies));
#Scenario-3 -------> Subquery returns a table
#Question - Print all actors whose age>70 and <85.
select * from (select name, year(curdate())-birth_year as age from actors) as actors_age where age between 70 and 85;

#Question- Select all the actors who acted in any of these movies (movie_id: 101, 110, 121)
select * from actors where actor_id = any(select actor_id from movie_actor where movie_id in (101, 110, 121));
# (or)
select * from actors where actor_id in (select actor_id from movie_actor where movie_id in (101, 110, 121));

#Question - Select all the movies whose rating is greater than any of the marvel movies rating
select * from movies where imdb_rating > all(select imdb_rating from movies where studio='marvel studios');
select * from movies where imdb_rating > any(select min(imdb_rating) from movies where studio = 'marvel studios');
select * from movies where imdb_rating > any(select imdb_rating from movies where studio = 'marvel studios');
select * from movies where imdb_rating > some(select imdb_rating from movies where studio = 'marvel studios');

#Question - Select the actor_id, actor_name, count of their movies acted in.
#Process-1
explain analyze
select actors.actor_id, actors.name, count(actors.actor_id) as movie_count from movie_actor 
join actors on movie_actor.actor_id = actors.actor_id
group by actors.actor_id
order by movie_count desc;
#Process-2
explain analyze
select 
	actor_id, 
    name,
    (select count(*) from movie_actor  where actor_id = actors.actor_id) as movie_count
from actors
order by movie_count desc;

#----------------------------------------------------------------------------------------------------------------------
#CTE - Common Table Expressions

select * from 
	(select name, birth_year, year(curdate())-birth_year as age from actors) as actors_age
where age between 70 and 85;

#Modify the above query - With CTE
with actors_age as(select name, birth_year, year(curdate())-birth_year as age from actors)
select * from actors_age where age between 70 and 85;

select * from actors_age; #(Error) - The reason is: the scope of this table(actors_age) is valid till the execution only.

#Question - Print all the movies that produced 500% profit or more and their rating is less than average rating for all movies.
#Solution: Divide the above problem
#case-1: Print all the movies that produced 500% profit or more
select
		*, round((revenue-budget)*100/budget, 2) as profit_percentage
from financials
where round((revenue-budget)*100/budget, 2)>= 500;

#case-2: Their rating is less than average rating
-- select round(avg(imdb_rating),2) as avg_imdb_rating from movies; #7.95
select * from movies where imdb_rating < (select avg(imdb_rating) as avg_imdb_rating from movies);


# With Subqueries
select 
	x.movie_id, x.profit_percentage,
    y.title, y.imdb_rating
from 
(
select
		*, round((revenue-budget)*100/budget, 2) as profit_percentage
from financials
) x 
join 
(
select * from movies where imdb_rating < (select avg(imdb_rating) as avg_imdb_rating from movies)
) y
on x.movie_id = y.movie_id
where round((revenue-budget)*100/budget, 2)>= 500;


# With CTE's
with
	x as (
			select
					*, round((revenue-budget)*100/budget, 2) as profit_percentage
			from financials
		 ),
    y as (
            select * from movies where imdb_rating < (select avg(imdb_rating) as avg_imdb_rating from movies)
		  )
select 
	x.movie_id, x.profit_percentage,
    y.title, y.imdb_rating
from x join y 
on x.movie_id = y.movie_id
where round((revenue-budget)*100/budget, 2)>= 500;