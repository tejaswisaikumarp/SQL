#Exercise - Subqueries

-- #Question-1
-- select distinct(release_year), count(*) as movie_count from movies group by release_year order by release_year;
select * 
from movies where 
release_year > (select min(release_year) from movies) and release_year < (select max(release_year) from movies);

#Question-2
select * from movies where imdb_rating > all (select round(avg(imdb_rating), 2) as average_imdb_rating from movies);