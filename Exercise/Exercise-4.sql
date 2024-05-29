#Exercise - Calculated columns

select * from financials;

#Question-1
select *, round(((revenue - budget)/budget), 2)*100 as profit_percentage from financials;

#Question-2
