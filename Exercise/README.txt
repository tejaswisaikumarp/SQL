Exercise-1
-----------
Write SQL queries for the following:

1. Print all movie titles and release year for all Marvel Studios movies.
2. Print all movies that have Avenger in their name.
3. Print the year when the movie "The Godfather" was released.
4. Print all distinct movie studios in the Bollywood industry.

------------------------------------------------------------------------------------------------------------

Exercise-2
Write SQL queries for the following:

1. Print all movies in the order of their release year (latest first)
2. All movies released in the year 2022
3. Now all the movies released after 2020
4. All movies after the year 2020 that have more than 8 rating
5. Select all movies that are by Marvel studios and Hombale Films
6. Select all THOR movies by their release year
7. Select all movies that are not from Marvel Studios

-------------------------------------------------------------------------------------------------------------

Exercise-3   Summary Analytics
Write SQL queries for the following:

1. How many movies were released between 2015 and 2022
2. Print the max and min movie release year
3. Print a year and how many movies were released in that year starting with the latest year

---------------------------------------------------------------------------------------------------------------

Exercise-4
Write SQL queries for the following,

1. Print profit % for all the movies

-----------------------------------------------------------------------------------------------------------------

Exercise-5
Write SQL queries for the following,

1. Show all the movies with their language names
2. Show all Telugu movie names (assuming you don't know the language_id for Telugu)
3. Show the language and number of movies released in that language

------------------------------------------------------------------------------------------------------------------

Exercise-6
Write SQL queries for the following,

1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
Print movie name, revenue, currency, and unit

--------------------------------------------------------------------------------------------------------------------

Exercise-7
Write SQL queries for the following,

1. Select all the movies with minimum and maximum release_year. Note that there
can be more than one movie in min and a max year hence output rows can be more than 2
    
2. Select all the rows from the movies table whose imdb_rating is higher than the average rating

----------------------------------------------------------------------------------------------------------------------

Exercise-8
Write SQL queries for the following,

Select all Hollywood movies released after the year 2000 that made more than 500 million $ profit or more profit. 
Note that all Hollywood movies have millions as a unit hence you don't need to do the unit conversion. 
Also, you can write this query without CTE as well but you should try to write this using CTE only

------------------------------------------------------------------------------------------------------------------------

Exercise-9
Write a SQL Query using CTE for the following

Retrieve the top 2 markets in every region by their gross sales amount in FY=2021

-------------------------------------------------------------------------------------------------------------------------

Exercise-10

Write a query for the below scenario.

The supply chain business manager wants to see which customers’ forecast accuracy has dropped from 2020 to 2021. Provide a complete report with these columns: customer_code, customer_name, market, forecast_accuracy_2020, forecast_accuracy_2021

HINT: You can use the query with CTE that was used to generate a forecast accuracy report in the previous chapter first for 2021 and then for 2020. Then you can use these two tables. You can temporarily cache these tables in a temporary table or another CTE and then perform the join between the two.
--------------------------------------------------------------------------------------------------------------------------
