# Exercise - CTE
# Question - Implement CTE. Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit.

explain analyze
with
	x as (
			select * from movies where industry = 'hollywood' and release_year > 2000
		 ),
    y as (
            select movies.movie_id, movies.title, round((revenue-budget),2) as profit
			from movies join financials
			on movies.movie_id = financials.movie_id
			
		  )
select 
x.movie_id, x.title, x.industry,
y.profit
from x join y 
on x.movie_id = y.movie_id
where profit > 500;





