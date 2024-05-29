-- Exercise - 
-- a. The supply chain business manager wants to see which customers’ forecast accuracy has dropped from 2020 to 2021. 
-- b. Provide a complete report with these columns: customer_code, customer_name, market, forecast_accuracy_2020, forecast_accuracy_2021
create temporary table forecast_accuracy_2020
with forecast_error_table as(
select 
		gdb0041.fact_act_est.customer_code,sum(fact_act_est.sold_quantity) as total_quantity_sold,
        sum(fact_act_est.forecast_quantity) as total_forecast_quantity_sold,
        sum(forecast_quantity-sold_quantity) as net_error,
        sum((forecast_quantity-sold_quantity))*100/sum(forecast_quantity) as net_error_pct,
        sum(abs(forecast_quantity-sold_quantity)) as abs_error,
        sum(abs(forecast_quantity-sold_quantity))*100/sum(forecast_quantity) as abs_error_pct        
from gdb0041.fact_act_est
where gdb0041.fact_act_est.fiscal_year=2020
group by gdb0041.fact_act_est.customer_code
)
select 
		dim_customer.customer, if(abs_error_pct >100, 0, 100-abs_error_pct) as forecast_accuracy_2020, dim_customer.market,
        forecast_error_table.*        
from forecast_error_table
join dim_customer
on forecast_error_table.customer_code = dim_customer.customer_code
order by forecast_accuracy_2020 desc;


create temporary table forecast_accuracy_2021
with forecast_error_table as(
select 
		gdb0041.fact_act_est.customer_code,sum(fact_act_est.sold_quantity) as total_quantity_sold,
        sum(fact_act_est.forecast_quantity) as total_forecast_quantity_sold,
        sum(forecast_quantity-sold_quantity) as net_error,
        sum((forecast_quantity-sold_quantity))*100/sum(forecast_quantity) as net_error_pct,
        sum(abs(forecast_quantity-sold_quantity)) as abs_error,
        sum(abs(forecast_quantity-sold_quantity))*100/sum(forecast_quantity) as abs_error_pct        
from gdb0041.fact_act_est
where gdb0041.fact_act_est.fiscal_year=2021
group by gdb0041.fact_act_est.customer_code
)
select 
		dim_customer.customer, if(abs_error_pct >100, 0, 100-abs_error_pct) as forecast_accuracy_2021, dim_customer.market,
        forecast_error_table.*        
from forecast_error_table
join dim_customer
on forecast_error_table.customer_code = dim_customer.customer_code
order by forecast_accuracy_2021 desc;


select 
		*
from forecast_accuracy_2020 join forecast_accuracy_2021
on 
	forecast_accuracy_2020.customer_code = forecast_accuracy_2021.customer_code
where 	
forecast_accuracy_2020.forecast_accuracy_2020 > forecast_accuracy_2021.forecast_accuracy_2021;

