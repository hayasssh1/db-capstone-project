USE LittleLemonDB;

-- task 1 insert data into Bookings table
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
VALUES
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);

-- task 2 create stored procedure for checking booking status
DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER $$

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	SELECT CONCAT("Table", " ", TableNumber, " is already booked") AS "Booking Status"
    FROM Bookings
    WHERE BookingDate = booking_date AND TableNumber = table_number;
END $$

DELIMITER ;

CALL CheckBooking("2022-11-12", 3);

-- task 3 create transaction
DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER $$
CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE existing_table_no INT;
    SELECT TableNumber INTO existing_table_no 
    FROM Bookings 
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    
	START TRANSACTION;
	INSERT INTO Bookings(TableNumber, BookingDate)
    VALUES(table_number, booking_date);
    
    IF existing_table_no IS NULL THEN
		COMMIT;
    ELSE 
		ROLLBACK;
		SELECT CONCAT("Table ", table_number, " is already booked - booking cancelled") AS "Booking status";
    END IF;
END $$

DELIMITER ;

CALL AddValidBooking("2022-12-17", 6)