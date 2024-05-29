#Exercise - Summary analytics
select * from movies;

#Question-1
select release_year, count(release_year) as movie_count from movies 
where release_year in (2022, 2015)
group by release_year;

select release_year, count(release_year) as movie_count from movies 
where release_year between 2015 and 2022
group by release_year;

#Question-2
select max(release_year) as max_release_year, min(release_year) as min_release_year from movies;

#Question-3
select release_year, count(*) as year_count from movies
group by release_year
order by release_year desc;


