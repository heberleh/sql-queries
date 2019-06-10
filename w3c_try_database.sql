


-- Number of orders by Customer.Country, having Total > 10
SELECT COUNT(Orders.OrderID) AS Total, Country
FROM Customers JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Country
HAVING Total > 10
ORDER BY Total DESC;


