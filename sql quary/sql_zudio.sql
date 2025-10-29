
### 1.What is the total revenue generated per store?
select city, sum(quantity*unit_price) as total_revenue from 
zudio_sales_items as si join zudio_sales as s 
on s.sale_id=si.sale_id
join zudio_stores as st on s.store_id=st.store_id
group by city
order by total_revenue desc;

###2.Which product category generates the highest total sales in ₹?
select  category,sum(total_sale)as total_sales 
from zudio_sales_items si join products p 
on si.product_id=p.product_id
group by category
order by total_sales desc limit 1;

#3.Which store has the highest average sales per transaction?
select payment_mode,store_name, sum(total_sale) as total_average from zudio_sales_items si join
zudio_sales s on si.sale_id=s.sale_id
join zudio_stores st on s.store_id=st.store_id
group by payment_mode,store_name
order by total_average desc;

#4.What is the monthly sales trend across all stores?
select year(sale_date) as year,
month(sale_date) as month,
sum(quantity*unit_price) as total_sale
from zudio_sales_items as zi inner join zudio_sales as zs
on zi.sale_id=zs.sale_id
group by month,year 
order by month;

#5 What are the total sales made in each city?
 select city ,sum(total_sale)as total_sales 
 from zudio_sales_items as zi inner join zudio_sales as zs on zi.sale_id=zs.sale_id 
 inner join zudio_stores as zst on zst.store_id=zs.store_id
 group by city
 order by total_sales;
 
 #6 Which are the top 5 best-selling products by quantity and revenue?
select product_name, sum(quantity) as quantity,sum(total_sale) as total_sale 
from products as p inner join zudio_sales_items as zi
on p.product_id=zi.product_id
group by product_name,quantity
order by total_sale desc
limit 5;

#7 Which products have the lowest total quantity sold?
select product_name,sum(quantity) as quatity,sum(total_sale)as total_sale
from zudio_sales_items as zi inner join products as p 
on zi.product_id=p.product_id
group by product_name,quantity
order by total_sale
limit 5;

#8 What is the total quantity sold for each product category?
select category,sum(quantity) as total_quantity ,sum(total_sale)as total_sale
from products as p inner join  zudio_sales_items as zs 
on p.product_id=zs.product_id
group by category
order by total_quantity desc;

# 9 What is the average unit price of products in each category?
select category,avg(unit_price) average_unit 
from products as p inner join zudio_sales_items as zi
on p.product_id=zi.product_id
group by category
order by average_unit desc;

#10 Which age group spends the most money on average?
select age,avg(total_sale) as average_spends from 
customers as c inner join zudio_sales as zs
on c.customer_id=zs.customer_id 
inner join zudio_sales_items as zi on zs.sale_id=zi.sale_id
group by age
order by average_spends desc;

#11 How many unique customers visited each store?
select store_name,count(distinct c.customer_id) as unique_customer
from customers as c inner join zudio_sales as zs 
on c.customer_id=zs.customer_id
inner join zudio_stores as zst on zs.store_id=zst.store_id 
group by store_name
order by unique_customer desc;

#12 Which customers made the most purchases
select customer_name,count(*) as purchase_count from customers as c inner join zudio_sales as zs
on c.customer_id=zs.customer_id
group by customer_name
order by purchase_count
limit 15;


#13 What is the average number of items bought per customer?
select  c.customer_id,customer_name,avg(quantity)as average_quantity
from zudio_sales_items as zst inner join zudio_sales as zs
on zst.sale_id=zs.sale_date inner join customers as c
on zs.customer_id=c.customer_id
group by customer_name,c.customer_id
order by customer_id; 

#14 Which cities have the highest number of loyal customers (more than 5 purchases)?
select city,count(*) as loyal_customers 
from (select c.customer_id,city from customers as c inner join zudio_sales as zst
on c. customer_id=zst.customer_id
group by customer_id,city
having count(*)>5) as loyal
group by city
order by loyal_customers desc;

#15 Which payment mode is used the most overall and per store
select payment_mode ,count(zs.store_id) as total_transaction 
from zudio_sales as zs inner join  zudio_stores as zst
on zs.store_id=zst.store_id
group by payment_mode
order by total_transaction desc
limit 1;


#16 What is the average transaction value by payment mode?
select payment_mode, avg(total_sale)as total_avg from 
zudio_sales_items as zi inner join zudio_sales as zs
on zi.sale_id=zs.sale_id
group by payment_mode
order by total_avg desc;


# 17 What is the average basket size (number of items) by store and city?
select store_name,city,avg(quantity) as avg_quantity 
from zudio_sales_items as zi inner join zudio_sales as zs
on zi.sale_id=zs.sale_id inner join zudio_stores as zst
on zs.store_id=zst.store_id
group by store_name,city
order by avg_quantity desc;



