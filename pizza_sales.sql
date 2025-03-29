select * from pizza_sale

--total price

select sum(total_price) as total_revenue from pizza_sale

--average order value

select sum(total_price) / count(distinct(order_id)) as average_order_value from pizza_sale

--total pizza sold

select sum(quantity) as total_pizza from pizza_sale

--total order

select count(distinct order_id) as total_order from pizza_sale

--total_pizza_per_order

select cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as total_pizza_per_order 
from pizza_sale

--orders by week

select datename(DW,order_date) as days_of_week,
count(distinct (order_id)) as total_orders
from pizza_sale
group by datename(DW,order_date)

--order by hour

select datepart(hour,order_time) as hours,
count(distinct order_id) as total_order
from pizza_sale
group by datepart(hour,order_time)
order by datepart(hour,order_time)

--percentage of revenue by pizza category

select pizza_category,sum(total_price)*100/(select sum(total_price) from pizza_sale) as revenue_percentage
from pizza_sale
group by pizza_category

--percentage of revenue by pizza_size

select pizza_size,sum(total_price)*100/(select sum(total_price) from pizza_sale) as revenue_percentage
from pizza_sale
group by pizza_size

--total pizza sold by pizza category

select pizza_category,sum(quantity) as total_pizzas_sold
from pizza_sale
group by pizza_category

--total pizza sold by pizza name (top 5)

select top 5 pizza_name,sum(quantity) as total_pizzas_sold
from pizza_sale
group by pizza_name order by sum(quantity) desc

--total pizza sold by pizza name (bottom 5)

select top 5 pizza_name,sum(quantity) as total_pizzas_sold
from pizza_sale
group by pizza_name order by sum(quantity) asc




