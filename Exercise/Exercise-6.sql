#Exercise - Join more than two tables

select movies.title, movies.industry, financials.budget, financials.revenue, financials.currency, financials.unit,
case
when unit = 'thousands' then round(revenue/1000, 2)
when unit = 'billions' then round(revenue*1000, 2)
else round(revenue, 2)
end as revenue_millions
from movies
join financials on movies.movie_id=financials.movie_id
where industry = 'bollywood'
order by revenue_millions desc;


