-- Inserting data into RoomType table
INSERT INTO RoomType (RoomType_ID, Type_Name, Description, Base_Rate)
VALUES
(1, 'Single', 'Single occupancy room', 100.00),
(2, 'Double', 'Double occupancy room', 150.00),
(3, 'Suite', 'Luxury suite', 250.00),
(4, 'Family', 'Family room', 200.00),
(5, 'VIP', 'VIP suite', 300.00),
(6, 'Penthouse', 'Penthouse suite', 500.00),
(7, 'Standard', 'Standard room', 80.00),
(8, 'Executive', 'Executive suite', 400.00),
(9, 'Deluxe', 'Deluxe room', 120.00),
(10, 'Superior', 'Superior room', 180.00),
(11, 'Ocean View', 'Room with ocean view', 220.00),
(12, 'Mountain View', 'Room with mountain view', 200.00),
(13, 'City View', 'Room with city view', 160.00),
(14, 'Pool View', 'Room with pool view', 180.00),
(15, 'Garden View', 'Room with garden view', 140.00);

-- Inserting data into StaffRole table
INSERT INTO StaffRole (Role_ID, Role_Name, Description)
VALUES
(1, 'Manager', 'Responsible for overall management'),
(2, 'Receptionist', 'Handles guest inquiries and reservations'),
(3, 'Housekeeper', 'Responsible for cleaning and maintaining rooms'),
(4, 'Waiter/Waitress', 'Serves food and beverages to guests'),
(5, 'Chef', 'Prepares and cooks meals'),
(6, 'Security Guard', 'Ensures safety and security of the premises'),
(7, 'Maintenance Staff', 'Handles repairs and maintenance work'),
(8, 'Concierge', 'Assists guests with various services and recommendations'),
(9, 'Accountant', 'Manages financial records and transactions'),
(10, 'Event Planner', 'Organizes and coordinates events for guests'),
(11, 'Spa Therapist', 'Provides spa treatments and massages'),
(12, 'Fitness Instructor', 'Leads fitness classes and provides training'),
(13, 'Tour Guide', 'Guides guests on local tours and attractions'),
(14, 'Driver', 'Provides transportation services for guests'),
(15, 'Entertainer', 'Entertains guests with performances or activities');

-- Inserting data into Room table
INSERT INTO Room (Room_ID, RoomType_ID, Room_Number, Occupancy, Rate, Availability)
VALUES
(1, 1, 101, 1, 100.00, 1),
(2, 2, 102, 2, 150.00, 1),
(3, 3, 103, 1, 250.00, 1),
(4, 4, 104, 4, 200.00, 1),
(5, 5, 105, 2, 300.00, 1),
(6, 6, 106, 2, 500.00, 1),
(7, 7, 107, 1, 80.00, 1),
(8, 8, 108, 2, 400.00, 1),
(9, 9, 109, 1, 120.00, 1),
(10, 10, 110, 2, 180.00, 1),
(11, 11, 111, 2, 220.00, 1),
(12, 12, 112, 2, 200.00, 1),
(13, 13, 113, 1, 160.00, 1),
(14, 14, 114, 1, 180.00, 1),
(15, 15, 115, 1, 140.00, 1);

-- Inserting data into Staff table
INSERT INTO Staff (Staff_ID, Staff_Name, Role_ID, Salary, Hire_Date)
VALUES
(1, 'John Doe', 1, 5000.00, '2024-01-01'),
(2, 'Jane Smith', 2, 4000.00, '2024-01-02'),
(3, 'Michael Johnson', 3, 4500.00, '2024-01-03'),
(4, 'Emily Williams', 4, 3500.00, '2024-01-04'),
(5, 'David Brown', 5, 6000.00, '2024-01-05'),
(6, 'Jessica Davis', 6, 7000.00, '2024-01-06'),
(7, 'Christopher Wilson', 7, 3800.00, '2024-01-07'),
(8, 'Sarah Martinez', 8, 4500.00, '2024-01-08'),
(9, 'Matthew Anderson', 9, 5500.00, '2024-01-09'),
(10, 'Laura Taylor', 10, 4800.00, '2024-01-10'),
(11, 'Daniel Thomas', 11, 4200.00, '2024-01-11'),
(12, 'Ashley Jackson', 12, 4700.00, '2024-01-12'),
(13, 'Joshua White', 13, 4000.00, '2024-01-13'),
(14, 'Amanda Harris', 14, 3800.00, '2024-01-14'),
(15, 'Michaela Martin', 15, 4300.00, '2024-01-15');


-- Inserting data into Guest table
INSERT INTO Guest (Guest_ID, Guest_Name, Contact_Number, Email, Check_In_Date, Check_Out_Date, Room_ID)
VALUES
(1, 'John Doe', 1234567890, 'john@example.com', '2024-01-01', '2024-01-05', 1),
(2, 'Jane Smith', 9876543210, 'jane@example.com', '2024-01-02', '2024-01-06', 2),
(3, 'Michael Johnson', 5555555555, 'michael@example.com', '2024-01-03', '2024-01-07', 3),
(4, 'Emily Williams', 3333333333, 'emily@example.com', '2024-01-04', '2024-01-08', 4),
(5, 'David Brown', 2222222222, 'david@example.com', '2024-01-05', '2024-01-09', 5),
(6, 'Jessica Davis', 1111111111, 'jessica@example.com', '2024-01-06', '2024-01-10', 6),
(7, 'Christopher Wilson', 9999999999, 'christopher@example.com', '2024-01-07', '2024-01-11', 7),
(8, 'Sarah Martinez', 8888888888, 'sarah@example.com', '2024-01-08', '2024-01-12', 8),
(9, 'Matthew Anderson', 7777777777, 'matthew@example.com', '2024-01-09', '2024-01-13', 9),
(10, 'Laura Taylor', 6666666666, 'laura@example.com', '2024-01-10', '2024-01-14', 10),
(11, 'Daniel Thomas', 5555555555, 'daniel@example.com', '2024-01-11', '2024-01-15', 11),
(12, 'Ashley Jackson', 4444444444, 'ashley@example.com', '2024-01-12', '2024-01-16', 12),
(13, 'Joshua White', 3333333333, 'joshua@example.com', '2024-01-13', '2024-01-17', 13),
(14, 'Amanda Harris', 2222222222, 'amanda@example.com', '2024-01-14', '2024-01-18', 14),
(15, 'Michaela Martin', 1111111111, 'michaela@example.com', '2024-01-15', '2024-01-19', 15);


-- Inserting data into Reservation table
INSERT INTO Reservation (Reservation_ID, Guest_ID, Room_ID, Check_In_Date, Check_Out_Date)
VALUES
(1, 1, 1, '2024-01-01', '2024-01-05'),
(2, 2, 2, '2024-01-02', '2024-01-06'),
(3, 3, 3, '2024-01-03', '2024-01-07'),
(4, 4, 4, '2024-01-04', '2024-01-08'),
(5, 5, 5, '2024-01-05', '2024-01-09'),
(6, 6, 6, '2024-01-06', '2024-01-10'),
(7, 7, 7, '2024-01-07', '2024-01-11'),
(8, 8, 8, '2024-01-08', '2024-01-12'),
(9, 9, 9, '2024-01-09', '2024-01-13'),
(10, 10, 10, '2024-01-10', '2024-01-14'),
(11, 11, 11, '2024-01-11', '2024-01-15'),
(12, 12, 12, '2024-01-12', '2024-01-16'),
(13, 13, 13, '2024-01-13', '2024-01-17'),
(14, 14, 14, '2024-01-14', '2024-01-18'),
(15, 15, 15, '2024-01-15', '2024-01-19');

-- Inserting data into Invoice table
INSERT INTO Invoice (Invoice_ID, Reservation_ID, Invoice_Date)
VALUES
(1, 1, '2024-01-05'),
(2, 2, '2024-01-06'),
(3, 3, '2024-01-07'),
(4, 4, '2024-01-08'),
(5, 5, '2024-01-09'),
(6, 6, '2024-01-10'),
(7, 7, '2024-01-11'),
(8, 8, '2024-01-12'),
(9, 9, '2024-01-13'),
(10, 10, '2024-01-14'),
(11, 11, '2024-01-15'),
(12, 12, '2024-01-16'),
(13, 13, '2024-01-17'),
(14, 14, '2024-01-18'),
(15, 15, '2024-01-19');


-- Inserting data into Payment table
INSERT INTO Payment (Payment_ID, Invoice_ID, Amount, Payment_Date)
VALUES
(1, 1, 150.00, '2024-01-05'),
(2, 2, 200.00, '2024-01-06'),
(3, 3, 180.00, '2024-01-07'),
(4, 4, 220.00, '2024-01-08'),
(5, 5, 250.00, '2024-01-09'),
(6, 6, 300.00, '2024-01-10'),
(7, 7, 280.00, '2024-01-11'),
(8, 8, 190.00, '2024-01-12'),
(9, 9, 210.00, '2024-01-13'),
(10, 10, 240.00, '2024-01-14'),
(11, 11, 270.00, '2024-01-15'),
(12, 12, 230.00, '2024-01-16'),
(13, 13, 260.00, '2024-01-17'),
(14, 14, 290.00, '2024-01-18'),
(15, 15, 320.00, '2024-01-19');

-- Inserting data into RoomService table
INSERT INTO RoomService (Service_ID, Room_ID, Staff_ID, Shampoo_Quantity, Bathrobe_Quantity, Soap_Quantity, Brush_Quantity, Towels_Quantity, Service_Date)
VALUES
    (1, 101, 1, 2, 1, 3, 1, 2, '2023-01-01'),
    (2, 102, 2, 1, 2, 2, 1, 3, '2023-01-02'),
    (3, 103, 3, 3, 1, 1, 2, 2, '2023-01-03'),
    (4, 104, 4, 2, 1, 2, 1, 2, '2023-01-04'),
    (5, 105, 5, 1, 3, 2, 2, 3, '2023-01-05'),
    (6, 106, 6, 2, 1, 1, 1, 2, '2023-01-06'),
    (7, 107, 7, 3, 2, 2, 1, 3, '2023-01-07'),
    (8, 108, 8, 2, 2, 1, 2, 2, '2023-01-08'),
    (9, 109, 9, 1, 1, 3, 1, 1, '2023-01-09'),
    (10, 110, 10, 3, 2, 2, 2, 3, '2023-01-10'),
    (11, 111, 11, 2, 1, 1, 1, 2, '2023-01-11'),
    (12, 112, 12, 1, 2, 3, 1, 3, '2023-01-12'),
    (13, 113, 13, 3, 1, 1, 2, 1, '2023-01-13'),
    (14, 114, 14, 2, 2, 2, 1, 2, '2023-01-14'),
    (15, 115, 15, 1, 3, 1, 2, 3, '2023-01-15');


-- Inserting data into Inventory table
INSERT INTO Inventory (Inventory_ID, Item_Name, Quantity)
VALUES
(1, 'Shampoo', 50),
(2, 'Bathrobe', 30),
(3, 'Soap', 100),
(4, 'Toothbrush', 80),
(5, 'Towels', 70),
(6, 'Slippers', 40),
(7, 'Hairbrush', 60),
(8, 'Conditioner', 45),
(9, 'Toothpaste', 90),
(10, 'Razor', 20),
(11, 'Lotion', 55),
(12, 'Shaving Cream', 25),
(13, 'Shower Cap', 35),
(14, 'Comb', 65),
(15, 'Body Wash', 75);


