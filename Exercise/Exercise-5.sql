#Exercise - SQL Joins

#Question-1
select movies.title, movies.language_id, languages.name
from movies left outer join languages
using (language_id);

#Question-2
select movies.title, movies.language_id, languages.name
from movies left outer join languages
using (language_id)
WHERE languages.name = 'telugu';

#Question-3
select languages.name, movies.title
from movies right outer join languages
using (language_id);

select languages.name, count(movies.title) as movie_count
from movies right outer join languages
using (language_id)
group by languages.name;