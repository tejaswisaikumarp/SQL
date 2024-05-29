# Exercise - Retrieve data using text query
select * from movies;

#Question-1
select title, release_year from movies where studio="marvel studios";
#Question-2
select title from movies where title like "%avengers%";
#Question-3
select release_year from movies where title="The Godfather";
#Question-4
select distinct studio from movies where industry="bollywood";