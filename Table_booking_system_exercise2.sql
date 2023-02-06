USE LittleLemonDB;
-- task 1 create a procedure AddingBooking
DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER $$
CREATE PROCEDURE AddBooking(booking_id INT, customer_id INT, booking_date DATE, table_number INT)
BEGIN
	INSERT INTO Bookings(BookingID, TableNumber, BookingDate, CustomerID)
    VALUES(booking_id, table_number, booking_date, customer_id);
    
    SELECT "New booking added" AS Confirmation;
END $$
DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");

-- task 2 create a procedure to update Bookings table
DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER $$
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE Bookings
    SET BookingDate = booking_date 
    WHERE BookingID = booking_id;
    
    SELECT CONCAT("Booking ", booking_id, " updated") AS Confirmation;
END $$
DELIMITER ;

CALL UpdateBooking(9, "2022-12-17");

-- task 3 create a procedure CancelBooking to delete bookings
DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER $$
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
	DELETE FROM Bookings
    WHERE BookingID = booking_id;
    
    SELECT CONCAT("Booking ", booking_id, " cancelled") AS Confirmation;
END $$
DELIMITER ;

CALL CancelBooking(9)