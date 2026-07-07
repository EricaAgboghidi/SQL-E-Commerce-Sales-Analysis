# SQL E-Commerce Sales Analysis
## Project Overview
This project explores an e-commerce sales dataset using Microsoft SQL Server to uncover meaningful business insights from transactional data. The analysis focuses on customer purchasing behavior, product performance, sales trends, payment preferences, marketing effectiveness, and operational performance

-<a href="https://docs.google.com/spreadsheets/d/1N4-eLmaH5I2oNfUTh-qppwjMmC0Ktqhh/edit?gid=727130089#gid=727130089">Dataset Used</a>

## Objectives
This project answers the following business questions:
1.	Which products generate the highest revenue? 
2.	Which products are ordered most frequently? 
3.	What is the average order value? 
4.	Which month generates the highest revenue each year? 
5.	Which day records the highest sales each year? 
6.	Which payment method is most popular? 
7.	Which payment method generates the highest revenue? 
8.	Which customers spend the most? 
9.	How many repeat customers are there? 
10.	Which referral source brings the highest-value customers? 
11.	Which coupon is used most often? 
12.	Do coupons increase the average order value? 
13.	What percentage of orders are shipped each year? 
14.	Which orders are statistical outliers? 
15.	What is the median order value? 
16.	What is the average number of items per cart? 
17.	Do customers with larger carts spend more? 
18.	Are there seasonal sales trends? 

## Tools Used
- Microsoft SQL Server 
- SQL Server Management Studio (SSMS) 

## SQL Concepts Demonstrated
•	Data aggregation 
•	Grouping and filtering 
•	Common Table Expressions (CTEs) 
•	Window functions 
•	Ranking functions 
•	Date manipulation 
•	Conditional aggregation using CASE 
•	Statistical analysis using percentiles 
•	Outlier detection using the Interquartile Range (IQR) method 

## Business Questions Answered
1. Product Performance
     Highest revenue-generating products 
     Most frequently purchased products 
2. Sales Performance
     Average order value 
     Median order value 
     Monthly revenue trends 
     Peak sales days 
     Seasonal sales patterns 
3. Customer Analysis
     Highest-spending customers 
     Repeat customers 
     Customer purchasing behavior 
4. Marketing Analysis
     Referral source effectiveness 
     Coupon usage 
     Coupon impact on average order value 
5. Operational Analysis
     Order shipment rate 
     Payment method popularity 
     Revenue by payment method 
6. Statistical Analysis
     Detection of unusually large orders using the IQR method

## Skills Demonstrated
•	SQL querying 
•	Data exploration 
•	Business analysis 
•	Descriptive statistics 
•	Window functions 
•	Analytical thinking 

## Key Findings
1. Product Performance: Chair generated the highest revenue (195,620.11), narrowly outperforming Printer (195,612.61), making it the strongest revenue contributor. Printer was the most frequently purchased product with 181 orders, indicating strong and consistent customer demand. 
Although Chair generated the highest revenue, Printer's higher order volume suggests customers purchased it more often, while Chair likely had a slightly higher average selling price. 
2. Overall Sales Performance: The business generated 1,264,761.96 in total revenue from 1,200 orders. The Average Order Value (AOV) was 1,053.97. The Median Order Value was 823.62, noticeably lower than the average, indicating that a relatively small number of high-value purchases increased the overall average. 
3. Monthly Sales Trends
The highest revenue-generating month differed by year: June emerged as the strongest-performing month in two of the three years, suggesting recurring seasonal demand.
4. Daily Sales Performance: This showed that peak sales occurred on isolated high-performing dates rather than following a consistent calendar pattern.
5. Payment Analysis: Online payments were the most frequently used payment method with 258 orders. Credit Card transactions generated the highest revenue (263,847.63), suggesting customers using credit cards tended to make higher-value purchases. 
6. Customer Analysis: The highest-spending customer generated 5,723.23 in total revenue. Only 11 customers placed repeat orders, indicating a relatively low customer retention rate compared to the overall customer base. 
7. Referral Source Performance: Instagram produced both the highest revenue and the largest number of customers (257), making it the most effective acquisition channel.
8. Coupon Analysis: FREESHIP was the most frequently used coupon (313 orders). Customers using coupons recorded a slightly higher average order value (1,057.64) compared to customers without coupons (1,043.37). 
This suggests coupon campaigns may encourage customers to spend slightly more per transaction.
9. Shipping Performance: Shipping rates remained relatively low across all years. Although 2024 showed modest improvement, fewer than one-quarter of orders were recorded as shipped, suggesting either operational delays or incomplete shipment records.
10. Statistical Outliers: Eight high-value orders were identified as statistical outliers using the Interquartile Range (IQR) method. These transactions ranged between approximately 3,324 and 3,456, significantly exceeding the upper bound of normal order values.
11. Shopping Cart Behaviour: Customers purchased an average of 5 items per cart. Orders containing 10 items achieved the highest Average Order Value (1,743.22). Overall, larger shopping carts were associated with higher customer spending, indicating a positive relationship between basket size and revenue. 
12. Seasonality: Sales fluctuated throughout the year, with May and June consistently delivering strong revenue performance.
No single month dominated every year, but mid-year months repeatedly outperformed others, suggesting moderate seasonal purchasing behaviour.

## Business Recommendations
1. Prioritize High-Revenue Products: Continue promoting Chair and Printer, as they contribute the largest share of revenue. Consider bundling these products with complementary items to increase average order value further.
2. Strengthen Customer Retention: With only 11 repeat customers, improving retention should be a priority. Introduce loyalty rewards, personalized email campaigns, and post-purchase engagement to encourage repeat purchases.
3. Increase Investment in Instagram Marketing: Instagram generated both the highest revenue and the largest customer base. Increasing marketing investment on this channel could produce higher returns while maintaining strong customer acquisition.
4. Expand Coupon Strategies: Customers using coupons spent slightly more on average than those without coupons. Testing targeted promotions, minimum-spend discounts, or bundled offers may further increase average order value while protecting profit margins.
5. Encourage Larger Basket Sizes: Since customers with larger carts consistently spent more, implement cross-selling, product recommendations, and "Buy More, Save More" promotions to increase basket size and overall revenue.
6. Prepare for Seasonal Demand: Given the strong performance in May and June, inventory planning, staffing, and marketing campaigns should be intensified before these months to maximize sales opportunities.
7. Improve Shipping Operations: The relatively low shipping rates warrant further investigation. Review fulfilment workflows, shipping processes, and data quality to determine whether the issue reflects operational delays or incomplete status updates.
8. Monitor High-Value Transactions: The identified outlier orders represent valuable customer activity. These customers should be reviewed for potential VIP or loyalty programs while also verifying that unusually large transactions are legitimate and not the result of data errors.

## Conclusion
This project demonstrates how SQL can be used to transform transactional data into business insights that support data driven decision making. This analysis revealed opportunities to improve customer retention, optimize marketing investments, increase average order value, and better prepare for seasonal demand. It also highlighted the importance of combining descriptive statistics with business context to identify patterns that may not be immediately apparent from the raw data alone.
From a technical perspective, this project strengthened my proficiency in SQL by applying aggregate functions, Common Table Expressions (CTEs), window functions, ranking functions, conditional logic, date manipulation, and statistical methods such as median and interquartile range (IQR) analysis to solve real-world business problems.
Overall, this project reflects my ability to not only write SQL queries, but also interpret results, communicate insights effectively, and translate data into actionable business recommendations.


