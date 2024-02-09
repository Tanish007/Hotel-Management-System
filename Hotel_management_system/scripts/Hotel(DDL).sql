

-----CREATING Hotel Management DATABASE-----
CREATE DATABASE hotelManagement;

-----USING Hotel Management DATABASE-----
USE hotelManagement;

-------------------------------TABLE CREATION----------------------------


-- Creating Room table
CREATE TABLE Room (
    Room_ID INT PRIMARY KEY,
    RoomType_ID INT,
    Room_Number INT UNIQUE,
    Occupancy INT,
    Rate DECIMAL(10, 2),
    Availability BIT,
    FOREIGN KEY (RoomType_ID) REFERENCES RoomType(RoomType_ID)
);

-- Creating Guest table
CREATE TABLE Guest (
    Guest_ID INT PRIMARY KEY,
    Guest_Name VARCHAR(100),
    Contact_Number BIGINT,
    Email VARCHAR(100),
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Room_ID INT,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);


-- Creating Staff table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Staff_Name VARCHAR(100),
    Role_ID INT,
    Salary DECIMAL(10, 2),
    Hire_Date DATE,
    FOREIGN KEY (Role_ID) REFERENCES StaffRole(Role_ID)
);

-- Creating Reservation table
CREATE TABLE Reservation (
    Reservation_ID INT PRIMARY KEY,
    Guest_ID INT,
    Room_ID INT,
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Total_Cost DECIMAL(10, 2),
    FOREIGN KEY (Guest_ID) REFERENCES Guest(Guest_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

-- Creating Invoice table
CREATE TABLE Invoice (
    Invoice_ID INT PRIMARY KEY,
    Reservation_ID INT,
    Total_Amount DECIMAL(10, 2),
    Invoice_Date DATE,
    FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID)
);

-- Creating Payment table
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Invoice_ID INT,
    Amount DECIMAL(10, 2),
    Payment_Date DATE,
    FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID)
);

-- Creating RoomService table
CREATE TABLE RoomService (
    Service_ID INT PRIMARY KEY,
    Room_ID INT,
    Staff_ID INT,
    Shampoo_Quantity INT,
    Bathrobe_Quantity INT,
    Soap_Quantity INT,
    Brush_Quantity INT,
    Towels_Quantity INT,
    Service_Date DATE,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- Creating Inventory table
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY,
    Item_Name VARCHAR(100),
    Quantity INT,
);


---------------------------------------- Computed columns ---------------------------------------

-- Adding computed column for Total_Amount in Invoice table
ALTER TABLE Invoice
ADD Total_Amount AS (SELECT SUM(Amount) FROM Payment WHERE Payment.Invoice_Number = Invoice.Invoice_Number);


-- Adding computed column for Total_Cost in Reservation table
ALTER TABLE Reservation
ADD Total_Cost AS (DATEDIFF(DAY, Check_In_Date, Check_Out_Date) * Rate);



---------------------------------------- Non clustered Index -------------------------------------


-- Creating RoomType table with non-clustered index
CREATE TABLE RoomType (
    RoomType_ID INT PRIMARY KEY,
    Type_Name VARCHAR(50),
    Description TEXT,
    Base_Rate DECIMAL(10, 2)
);

CREATE NONCLUSTERED INDEX IX_RoomType_RoomTypeID ON RoomType(RoomType_ID);

-- Creating StaffRole table with non-clustered index
CREATE TABLE StaffRole (
    Role_ID INT PRIMARY KEY,
    Role_Name VARCHAR(100),
    Description TEXT
);

CREATE NONCLUSTERED INDEX IX_StaffRole_RoleID ON StaffRole(Role_ID);
