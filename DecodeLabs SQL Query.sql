--1. Which products generate the highest revenue?

SELECT Product,
       SUM (TotalPrice) AS Revenue
FROM Orders
GROUP BY Product
ORDER BY Revenue DESC;

--2. Which products are ordered most often?

SELECT Product,
       Count (OrderID) AS NumberOfOrders
FROM Orders
Group By Product
ORDER BY NumberOfOrders DESC;

--3. What is the average order value?

SELECT SUM (TotalPrice) AS Revenue,
       COUNT (OrderID) AS OrderCount,
       SUM (TotalPrice) / COUNT (OrderID) AS AveOrderValue
FROM Orders;

--4. Which month generates the most revenue for each year?

WITH MonthlyRevenue AS (
    SELECT
        YEAR([Date]) AS OrderYear,
        MONTH([Date]) AS OrderMonth,
        SUM(TotalPrice) AS TotalRevenue
    FROM Orders
    GROUP BY
        YEAR([Date]),
        MONTH([Date])
),
RankedRevenue AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY OrderYear
               ORDER BY TotalRevenue DESC
           ) AS RN
    FROM MonthlyRevenue
)
SELECT
    OrderYear,
    DATENAME(MONTH, DATEFROMPARTS(OrderYear, OrderMonth, 1)) AS MonthName,
    TotalRevenue
FROM RankedRevenue
WHERE RN = 1
ORDER BY OrderYear;

--5. Which day has the highest sales for each year?

WITH DailySales AS (
    SELECT
        YEAR([Date]) AS OrderYear,
        [Date]  AS SalesDate,
        SUM(TotalPrice) AS TotalRevenue
    FROM Orders
    GROUP BY
        YEAR([Date]), [Date]
),
RankedSales AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY OrderYear
               ORDER BY TotalRevenue DESC
           ) AS RN
    FROM DailySales
)
SELECT
    OrderYear,
    SalesDate,
    TotalRevenue
FROM RankedSales
WHERE RN = 1
ORDER BY OrderYear;

--6. Which payment method is most popular?

SELECT PaymentMethod,
       COUNT (OrderID) AS NumberOfOrders
FROM Orders
GROUP BY PaymentMethod
ORDER BY NumberOfOrders DESC;

--7. Which payment method generates the highest revenue?

SELECT PaymentMethod,
       SUM (TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;

--8. Which customers spend the most?

SELECT TOP 10
       CustomerID,
       SUM (TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY CustomerID
ORDER BY TotalRevenue DESC;

--9. How many repeat customers are there?

WITH RepeatCustomers AS (
   SELECT CustomerID,
          COUNT (OrderID) AS NumberOfOrders
   FROM Orders
   GROUP BY CustomerID
   HAVING COUNT (OrderID) > 1
   )
SELECT COUNT (NumberOfOrders) AS RepeatCustomersCount
FROM RepeatCustomers;

--10. Which referral source brings the highest-value customers?

SELECT ReferralSource,
       SUM (TotalPrice) AS Revenue,
       COUNT (DISTINCT CustomerID) AS TotalCustomers
FROM Orders
GROUP BY ReferralSource
ORDER BY Revenue DESC;

--11. Which coupon is used most often?

SELECT TOP 1
       CouponCode,
       COUNT (OrderID) AS NumberOfOrders
FROM Orders
GROUP BY CouponCode
ORDER BY NumberOfOrders DESC;

--12. Do coupons increase average order value?

SELECT
    CASE
        WHEN CouponCode = 'N/A' THEN 'No Coupon'
        ELSE 'Coupon Used'
    END AS CouponStatus,
    COUNT(OrderID) AS TotalOrders,
    AVG(TotalPrice) AS AverageOrderValue,
    SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY
    CASE
        WHEN CouponCode = 'N/A' THEN 'No Coupon'
        ELSE 'Coupon Used'
    END;

--13. What percentage of orders are shipped each year?

SELECT YEAR(Date) AS OrderYear,
       COUNT(OrderID) AS TotalOrders,
       SUM(CASE
            WHEN OrderStatus = 'Shipped' THEN 1
            ELSE 0
        END) AS CompletedOrders,
       ROUND (100.0 * SUM(CASE
            WHEN OrderStatus = 'Shipped' THEN 1
            ELSE 0
               END) / COUNT(OrderID), 2) AS CompletionRate
FROM Orders
GROUP BY YEAR(Date)
ORDER BY OrderYear DESC; 

--14. Which orders are statistical outliers?

WITH Quartiles AS (
    SELECT DISTINCT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY TotalPrice)
            OVER () AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY TotalPrice)
            OVER () AS Q3
    FROM Orders
)
SELECT
    o.OrderID,
    o.CustomerID,
    o.Product,
    o.TotalPrice,
    q.Q1,
    q.Q3,
    (q.Q3 - q.Q1) AS IQR
FROM Orders o
CROSS JOIN Quartiles q
WHERE o.TotalPrice < (q.Q1 - 1.5 * (q.Q3 - q.Q1))
   OR o.TotalPrice > (q.Q3 + 1.5 * (q.Q3 - q.Q1))
ORDER BY o.TotalPrice DESC;

--15. What is the median order value?

SELECT DISTINCT
    COUNT(*) OVER () AS TotalOrders,
    AVG(TotalPrice) OVER () AS AverageOrderValue,
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY TotalPrice)
        OVER () AS MedianOrderValue
FROM Orders;

--16. What is the average number of items per cart?

SELECT AVG (ItemsInCart) AS AveItemsInCart
FROM Orders;

--17. Do customers with larger carts spend more?

SELECT ItemsInCart,
       COUNT(OrderID) AS TotalOrders,
       AVG(TotalPrice) AS AverageOrderValue,
       SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY ItemsInCart
ORDER BY AverageOrderValue DESC;

--18. Are there seasonal sales trends?

SELECT
    YEAR(Date) AS OrderYear,
    MONTH(Date) AS OrderMonth,
    DATENAME(MONTH, Date) AS MonthName,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalPrice) AS TotalRevenue,
    AVG(TotalPrice) AS AverageOrderValue
FROM Orders
GROUP BY
    YEAR(Date),
    MONTH(Date),
    DATENAME(MONTH, Date)
ORDER BY
    OrderYear,
    TotalRevenue DESC;
