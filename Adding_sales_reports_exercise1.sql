USE LittleLemonDB;

-- task 1 creating views
CREATE VIEW OrdersView AS 
SELECT OrderID, Quantity, BillAmount
FROM Orders
WHERE Quantity > 2;

SELECT *
FROM OrdersView;

-- task 2 query data using JOINS
SELECT 
	c.CustomerId,
    CONCAT(c.FirstName, c.LastName) AS FullName,
    o.OrderID,
    o.BillAmount,
    m.MenuName,
    e.CourseName
FROM Customers AS c 
INNER JOIN Orders AS o USING(CustomerID)
INNER JOIN Menus AS m USING(MenuID)
INNER JOIN MenuItems AS e ON m.ItemID = e.ItemID
ORDER BY o.BillAmount ASC;

-- task 3 writing subquery
SELECT MenuName
FROM Menus
WHERE MenuID = ANY (SELECT MenuID FROM Orders WHERE Quantity > 2);

    
    
	