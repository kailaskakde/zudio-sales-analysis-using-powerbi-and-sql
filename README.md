# 🏬 Zudio Sales & Inventory Analysis using SQL & Power BI

---

## 📘 **Project Summary**
This project analyzes **Zudio retail store sales data** using **SQL** for business insights and **Power BI** for visualization.  
It uncovers sales performance, customer trends, top product categories, and store-level metrics to drive data-backed decisions.

---

## ❓ **Problem Statement**
Retail chains like Zudio face challenges in:
- Tracking sales and profit trends across stores  
- Identifying high-performing products and cities  
- Understanding customer purchase behavior  
- Analyzing payment preferences and stock movement  

This project solves these challenges through **SQL-based analytics** and a **Power BI dashboard** that provides interactive insights.

---

## 🧩 **Dataset Overview**
| Table Name | Description |
|-------------|-------------|
| `zudio_sales` | Contains sales transaction details (date, payment mode, customer ID, store ID, etc.) |
| `zudio_sales_items` | Includes product-level sales info like quantity, unit price, and total sale |
| `products` | Product details such as product name, category, and unit price |
| `customers` | Customer demographics (name, age, gender, city) |
| `zudio_stores` | Store information including city and store name |

---

## 🧠 **Tools & Technologies**
- 🗄️ **MySQL** – Data querying and analysis  
- 🐍 **Python (optional)** – Data cleaning & transformation  
- 📊 **Power BI Desktop** – Interactive dashboard visualization  
- ⚙️ **Power Query** – ETL and data integration  

---

## ⚙️ **Project Workflow**
1. Imported raw sales, products, and customer data into MySQL.  
2. Executed SQL queries to calculate key business metrics (sales, revenue, quantity, loyal customers, etc.).  
3. Cleaned and exported aggregated data to Power BI.  
4. Designed a dashboard with slicers for **Year**, **Month**, **Payment Mode**, and **Product Category**.  

---

## 🧮 **Key SQL Analysis Queries**

### 🔹 1. Total Revenue Generated per Store
```sql
SELECT city, SUM(quantity * unit_price) AS total_revenue
FROM zudio_sales_items AS si
JOIN zudio_sales AS s ON s.sale_id = si.sale_id
JOIN zudio_stores AS st ON s.store_id = st.store_id
GROUP BY city
ORDER BY total_revenue DESC;

```
🔹 2. Highest Selling Product Category
```sql
SELECT category, SUM(total_sale) AS total_sales
FROM zudio_sales_items si
JOIN products p ON si.product_id = p.product_id
GROUP BY category
ORDER BY total_sales DESC
LIMIT 1;
```
🔹 3. Top 5 Cities by Total Sales
```sql
SELECT city, SUM(total_sale) AS total_sales
FROM zudio_sales_items zi
JOIN zudio_sales zs ON zi.sale_id = zs.sale_id
JOIN zudio_stores zst ON zst.store_id = zs.store_id
GROUP BY city
ORDER BY total_sales DESC
LIMIT 5;
```
🔹 4. Monthly Sales Trend
```sql
SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month,
SUM(quantity * unit_price) AS total_sale
FROM zudio_sales_items zi
JOIN zudio_sales zs ON zi.sale_id = zs.sale_id
GROUP BY year, month
ORDER BY year, month;
```
🔹 5. Payment Mode Usage
```sql
SELECT payment_mode, COUNT(store_id) AS total_transactions
FROM zudio_sales
GROUP BY payment_mode
ORDER BY total_transactions DESC;
```



## 📊 Power BI Dashboard Overview
- 🎯 Dashboard Title: Zudio Sales Dashboard

## KPIs Displayed:

- 💰 Total Revenue: ₹413M
- 📦 Total Quantity Sold: 375K
- 📈 Average Sale: ₹2.75K


## 🧭 Key Visuals:
-  Donut Chart – Sales by Category (Footwear, Women, Kids, Men, Accessories)
-  Bar Chart – Sales by City (Pune, Mumbai, Bangalore, Chennai, Ahmedabad, Hyderabad)
-  Line Chart – Monthly Sales Trend
-  Dual Line Chart – Max/Min Sales by Category
-  Year-Month Slicers – Filter by year (2024–2025) and month

**Screenshot:**  
![Sales Dashboard](https://github.com/kailaskakde/zudio-sales-analysis-using-powerbi-and-sql/blob/main/image/Screenshot%202025-10-29%20140019.png)



## 🧾 Key Insights

- 🏆 Footwear (23%) and Women’s Wear (21%) lead in total sales.
- 🧭 Pune and Mumbai generated the highest revenue (₹61M each).
- 📅 May recorded the highest sales month-over-month.
- 💳 Online payment modes were most frequently used.
- 🛒 Accessories showed stable but moderate performance across all cities.



## 🏁 Results & Impact

- Identified top-performing cities and categories.
- Improved stock visibility and store-level performance.
- Helped management make data-backed sales and marketing decisions.
- Enhanced customer understanding through purchase and payment behavior analysis.

## 🔮 Future Enhancements

- Integrate live SQL connection with Power BI for real-time reporting.
- Add forecasting models using Python (ARIMA, Prophet).
- Extend dashboard with Customer Retention and Loyalty KPIs.

## 👤 Author & Contact
-  Kailas Kakde
- 📊 Data Analyst | Power BI | SQL | Python | Excel
- 📧 Email: kakdekailas0@gmail.com
- 🌐 LinkedIn: linkedin.com/in/kailas-kakde-b62ab2289


