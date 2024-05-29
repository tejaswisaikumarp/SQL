#Exercise - Retrieve Data Using Numeric Query (BETWEEN, IN, ORDER BY, LIMIT, OFFSET)
select * from movies;

#Question-1
select title, release_year from movies order by release_year desc;

#Question-2
select title, release_year from movies where release_year = 2022;

#Question-3
select title, release_year from movies where release_year > 2020 order by release_year;

#Question-4
select title, release_year, imdb_rating from movies where release_year > 2020 and imdb_rating > 8 order by release_year;

#Question-5
select title, studio from movies where studio in ("marvel studios", "hombale films");

#Question-6
select title as thor_movies, release_year from movies where title like "%thor%";

#Question-7
select title, studio from movies where studio!= "marvel studios";