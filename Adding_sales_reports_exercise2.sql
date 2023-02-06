-- task 1 create stored procedure
DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER $$

CREATE PROCEDURE GetMaxQuantyty()
BEGIN
	SELECT MAX(Quantity) AS "MAX Quantity in Order"
    FROM Orders;
END $$

DELIMITER ;

CALL GetMaxQuantyty();	

-- task 2 create prepared statement
PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, BillAmount FROM Orders WHERE OrderID = ?';
SET $id = 1;
EXECUTE GetOrderDetail USING @id;

-- task 3 
DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER $$

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
	DELETE FROM Orders
    WHERE OrderID = order_id;
    

    SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
    
END $$

DELIMITER ;
 

