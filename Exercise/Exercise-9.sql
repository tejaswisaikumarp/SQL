# Exercise - Retrieve the top 2 markets in every region by their gross sales amount in FY=2021

with cte1 as (select 
		dim_customer.market, dim_customer.region,
        sum(fact_sales_monthly.sold_quantity*fact_gross_price.gross_price)/1000000 as total_gross_mln
from dim_customer 
join fact_sales_monthly
on dim_customer.customer_code=fact_sales_monthly.customer_code
join fact_gross_price
on fact_sales_monthly.product_code=fact_gross_price.product_code
where fact_gross_price.fiscal_year=2021
group by dim_customer.market, dim_customer.region
order by total_gross_mln desc),
cte2 as (select 
		*,dense_rank() over(partition by region order by total_gross_mln desc) as DenseRank
			from cte1)
select * from cte2 where DenseRank<=2;
