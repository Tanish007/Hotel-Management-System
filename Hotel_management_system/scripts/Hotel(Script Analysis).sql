USE hotelManagement;
--------------------------STORED PROCEDURES---------------------------------------------------------------------------------------------------


--- Get the name of staff member who did room servicing for a particular room number

CREATE PROCEDURE GetStaffNameForRoomServicing
    @Room_ID INT
AS
BEGIN
    SELECT s.Staff_Name
    FROM RoomService rs
    INNER JOIN Staff s ON rs.Staff_ID = s.Staff_ID
    WHERE rs.Room_ID = @Room_ID;
END;

--EXEC GetStaffNameForRoomServicing @Room_ID = 101;

-- Total revenue generated
--EXEC CalculateTotalRevenue '2023-01-01', '2023-12-31';


CREATE PROCEDURE CalculateTotalRevenue
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(10, 2);

    -- Calculate total revenue from payments made within the specified time frame
    SELECT @TotalRevenue = ISNULL(SUM(Amount), 0)
    FROM Payment AS p
    INNER JOIN Invoice AS i ON p.Invoice_ID = i.Invoice_ID
    INNER JOIN Reservation AS r ON i.Reservation_ID = r.Reservation_ID
    WHERE p.Payment_Date BETWEEN @StartDate AND @EndDate;

    -- Display the total revenue
    SELECT @TotalRevenue AS TotalRevenue;
END;



-- highest revenue generated room type in a year

CREATE PROCEDURE HighestRevenueGeneratedPerRoomInAYear
AS
BEGIN
    SELECT 
        r.Room_Number,
        SUM(i.Total_Amount) AS TotalRevenue
    FROM 
        Room r
    INNER JOIN 
        Reservation res ON r.Room_ID = res.Room_ID
    INNER JOIN 
        Invoice i ON res.Reservation_ID = i.Reservation_ID
    WHERE 
        YEAR(res.Check_In_Date) = YEAR(GETDATE())
    GROUP BY 
        r.Room_Number
    ORDER BY 
        TotalRevenue DESC;
END;



-- finding peak check in and check out times

CREATE PROCEDURE FindPeakCheckInCheckOutTimes
AS
BEGIN
    SELECT 
        DATEPART(HOUR, Check_In_Date) AS CheckInHour,
        COUNT(*) AS CheckInCount
    FROM 
        Reservation
    GROUP BY 
        DATEPART(HOUR, Check_In_Date)
    ORDER BY 
        CheckInCount DESC;
END;




-- retrieves the room type with the maximum number of bookings
CREATE PROCEDURE FindMaxBookedRoomType AS
BEGIN
    SELECT TOP 1 WITH TIES rt.Type_Name, COUNT(*) AS Total_Bookings
    FROM Reservation r
    INNER JOIN RoomType rt ON r.RoomType_ID = rt.RoomType_ID
    GROUP BY rt.Type_Name
    ORDER BY COUNT(*) DESC;
END;


-- Retrieves the most requested room service items.

CREATE PROCEDURE GetMostRequestedRoomService AS
BEGIN
    SELECT TOP 1 WITH TIES Item_Name, COUNT(*) AS Request_Count
    FROM RoomService
    INNER JOIN Inventory ON RoomService.Item_Name = Inventory.Item_Name
    GROUP BY Item_Name
    ORDER BY Request_Count DESC;
END;





-------------------------- Triggers --------------------------------------


 -- Trigger to Update Room Availability
CREATE TRIGGER UpdateRoomAvailability ON Reservation AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Room_ID INT
    DECLARE @Reservation_ID INT

    SELECT @Room_ID = i.Room_ID, @Reservation_ID = i.Reservation_ID
    FROM INSERTED i;

    UPDATE Room
    SET Availability = 0
    WHERE Room_ID = @Room_ID;
END;


-- To create a trigger that updates the inventory based on room service requests for bathrobe, slipper, towels,

CREATE TRIGGER UpdateInventoryOnRoomService
ON RoomService
AFTER INSERT
AS
BEGIN
    DECLARE @RoomID INT;
    DECLARE @BathrobeQuantity INT;
    DECLARE @SlipperQuantity INT;
    DECLARE @TowelsQuantity INT;
    DECLARE @Refreshed BIT;

    SELECT @RoomID = Room_ID, 
           @BathrobeQuantity = Bathrobe_Quantity,
           @SlipperQuantity = Slipper_Quantity,
           @TowelsQuantity = Towels_Quantity,
           @Refreshed = Refreshed
    FROM inserted;

    IF @BathrobeQuantity IS NOT NULL
    BEGIN
        UPDATE Inventory
        SET Quantity = Quantity - @BathrobeQuantity
        WHERE Item_Name = 'Bathrobe';
    END;

    IF @SlipperQuantity IS NOT NULL
    BEGIN
        UPDATE Inventory
        SET Quantity = Quantity - @SlipperQuantity
        WHERE Item_Name = 'Slipper';
    END;

    IF @TowelsQuantity IS NOT NULL
    BEGIN
        UPDATE Inventory
        SET Quantity = Quantity - @TowelsQuantity
        WHERE Item_Name = 'Towels';
    END;

    IF @Refreshed = 1
    BEGIN
        -- Assuming 'Refreshment' is an inventory item
        UPDATE Inventory
        SET Quantity = Quantity - 1
        WHERE Item_Name = 'Refreshment';
    END;
END;
