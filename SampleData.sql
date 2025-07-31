-- Table 1: STUDENT
CREATE TABLE STUDENT (
    Roll_number VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50),
    Contact_no_1 VARCHAR(15),
    Contact_no_2 VARCHAR(15),
    Department VARCHAR(50),
    Mess_id INT,
    FOREIGN KEY (Mess_id) REFERENCES MESS(id)
);

-- Table 2: VENDOR
CREATE TABLE VENDOR (
    id INT PRIMARY KEY,
    Name VARCHAR(50),
    Contact_no_1 VARCHAR(15),
    Contact_no_2 VARCHAR(15)
);

-- Table 3: PAYMENT
CREATE TABLE PAYMENT (
    Transaction_id VARCHAR(20),
    Amount DECIMAL(10,2),
    Date DATE,
    Roll_number VARCHAR(20),
    Vendor_id INT,
    PRIMARY KEY (Transaction_id),
    FOREIGN KEY (Roll_number) REFERENCES STUDENT(Roll_number),
    FOREIGN KEY (Vendor_id) REFERENCES VENDOR(id)
);

-- Table 4: MESS
CREATE TABLE MESS (
    id INT PRIMARY KEY,
    Name VARCHAR(50),
    Capacity INT,
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    IssueDate DATE,
    DueDate DATE,
    Vendor_id INT,
    FOREIGN KEY (Vendor_id) REFERENCES Vendor(id)
);

-- Table 5: FEEDBACK (Weak entity)
CREATE TABLE FEEDBACK (
    Feedback_no INT,
    Roll_number VARCHAR(20),
    Mess_id INT,
    Rating INT,
    Comments CLOB,
    PRIMARY KEY (Feedback_no, Roll_number, Mess_id),
    FOREIGN KEY (Roll_number) REFERENCES STUDENT(Roll_number),
    FOREIGN KEY (Mess_id) REFERENCES MESS(id)
);

-- Table 6: REPRESENTATIVES
CREATE TABLE REPRESENTATIVES (
    Roll_no VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(30),
    Mess_id INT,
    FOREIGN KEY (Mess_id) REFERENCES MESS(id)
);

-- Table 7: WARDEN
CREATE TABLE WARDEN (
    Prof_id VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50),
    Contact_no_1 VARCHAR(15),
    Contact_no_2 VARCHAR(15),
    Mess_id INT,
    FOREIGN KEY (Mess_id) REFERENCES MESS(id)
);

-- Table 8: WORKERS
CREATE TABLE WORKERS (
    id INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(30),
    Contact_no_1 VARCHAR(15),
    Contact_no_2 VARCHAR(15),
    Mess_id INT,
    FOREIGN KEY (Mess_id) REFERENCES MESS(id)
);

-- Table 9: DAILY_MENU (Weak entity)
CREATE TABLE DAILY_MENU (
    Mess_id INT,
    Day VARCHAR(10),
    ItemId INT,
    DishName VARCHAR(50),
    Category VARCHAR(30),
    MealType VARCHAR(30),
    PRIMARY KEY (Mess_id, Day, ItemId),
    FOREIGN KEY (Mess_id) REFERENCES MESS(id)
);

-- Table 10: SPECIAL_DINNER (Weak entity)
CREATE TABLE SPECIAL_DINNER (
    Mess_id INT,
    Number INT,
    Date DATE,
    Theme VARCHAR(50),
    PRIMARY KEY (Mess_id, Number),
    FOREIGN KEY (Mess_id) REFERENCES MESS(id)
);


-- MESS Table
INSERT INTO MESS (id, Name, Capacity, Street, City, State, IssueDate, DueDate, Vendor_id) VALUES
(1, 'ifc a', 500, 'hostels', 'warangal', 'telangana', '2024-06-01', '2024-12-01',100),
(2, 'ifc b', 500, 'hostels', 'warangal', 'telangana', '2024-06-01', '2024-12-01',100),
(3, 'ifc c', 500, 'hostels', 'warangal', 'telangana', '2024-06-01', '2024-12-01',101),
(4, 'ifc d', 500, 'hostels', 'warangal', 'telangana', '2024-06-01', '2024-12-01',101);

-- VENDOR Table
INSERT INTO VENDOR (id, Name, Contact_no_1, Contact_no_2) VALUES
(100, 'shakti kitchen pvt ltd', '9876543201', '9876543202'),
(101, 'sheela cateerings pvt ltd', '9876543203', '9876543204');

-- STUDENT Table
INSERT INTO STUDENT (Roll_number, Name, Contact_no_1, Contact_no_2, Department, Mess_id) VALUES
('23CSB0B01', 'Aditya Mehta', '9876543210', '9876543290', 'CSE', 1),
('23EEB0A02', 'Vihaan Sharma', '9876543211', '9876543291', 'EEE', 2),
('22ECB0B03', 'Ira Mishra', '9876543212', '9876543292', 'ECE', 3),
('21BTB0A04', 'Anaya Reddy', '9876543213', '9876543293', 'BT', 4),
('24MNCB0B05', 'Jhanvi Verma', '9876543214', '9876543294', 'MNC', 1),
('23MEB0A06', 'Shaurya Patel', '9876543215', '9876543295', 'ME', 2),
('23MMEB0B07', 'Ritika Yadav', '9876543216', '9876543296', 'MME', 3),
('22CEB0A08', 'Ayaan Joshi', '9876543217', '9876543297', 'CE', 4),
('21CSB0B09', 'Sneha Desai', '9876543218', '9876543298', 'CSE', 1),
('24EEB0A10', 'Manav Singh', '9876543219', '9876543299', 'EEE', 2),
('23ECB0B11', 'Meera Naik', '9876543220', '9876543280', 'ECE', 3),
('22BTB0A12', 'Dev Saxena', '9876543221', '9876543281', 'BT', 4),
('24MNCB0B13', 'Aishwarya Goyal', '9876543222', '9876543282', 'MNC', 1),
('23MEB0A14', 'Parth Kapoor', '9876543223', '9876543283', 'ME', 2),
('23MMEB0B15', 'Nisha Menon', '9876543224', '9876543284', 'MME', 3),
('22CEB0A16', 'Yash Pillai', '9876543225', '9876543285', 'CE', 4),
('21CSB0B17', 'Kavya Choudhary', '9876543226', '9876543286', 'CSE', 1),
('24EEB0A18', 'Rudra Kale', '9876543227', '9876543287', 'EEE', 2),
('23ECB0B19', 'Shreya Pandey', '9876543228', '9876543288', 'ECE', 3),
('22BTB0A20', 'Aryan Verma', '9876543229', '9876543289', 'BT', 4),
('24MNCB0B21', 'Tanya Joshi', '9876543230', '9876543270', 'MNC', 1),
('23MEB0A22', 'Nikhil Reddy', '9876543231', '9876543271', 'ME', 2),
('23MMEB0B23', 'Diya Kapoor', '9876543232', '9876543272', 'MME', 3),
('22CEB0A24', 'Krishna Goyal', '9876543233', '9876543273', 'CE', 4),
('21CSB0B25', 'Avni Sharma', '9876543234', '9876543274', 'CSE', 1),
('24EEB0A26', 'Devansh Singh', '9876543235', '9876543275', 'EEE', 2),
('23ECB0B27', 'Simran Patel', '9876543236', '9876543276', 'ECE', 3),
('22BTB0A28', 'Kunal Menon', '9876543237', '9876543277', 'BT', 4),
('24MNCB0B29', 'Ishita Mehta', '9876543238', '9876543278', 'MNC', 1),
('23MEB0A30', 'Siddharth Naik', '9876543239', '9876543279', 'ME', 2),
('23MMEB0B31', 'Divya Choudhary', '9876543240', '9876543260', 'MME', 3),
('22CEB0A32', 'Kabir Kale', '9876543241', '9876543261', 'CE', 4),
('21CSB0B33', 'Pooja Pillai', '9876543242', '9876543262', 'CSE', 1),
('24EEB0A34', 'Rohan Saxena', '9876543243', '9876543263', 'EEE', 2),
('23ECB0B35', 'Sneha Joshi', '9876543244', '9876543264', 'ECE', 3),
('22BTB0A36', 'Harsh Patel', '9876543245', '9876543265', 'BT', 4),
('24MNCB0B37', 'Neha Verma', '9876543246', '9876543266', 'MNC', 1),
('23MEB0A38', 'Aarav Kapoor', '9876543247', '9876543267', 'ME', 2),
('23MMEB0B39', 'Priya Menon', '9876543248', '9876543268', 'MME', 3),
('22CEB0A40', 'Vivaan Goyal', '9876543249', '9876543269', 'CE', 4),
('21CSB0B41', 'Tanya Desai', '9876543250', '9876543259', 'CSE', 1),
('24EEB0A42', 'Aryan Pillai', '9876543251', '9876543258', 'EEE', 2),
('23ECB0B43', 'Ritika Naik', '9876543252', '9876543257', 'ECE', 3),
('22BTB0A44', 'Nitesh Saxena', '9876543253', '9876543256', 'BT', 4),
('24MNCB0B45', 'Shreya Joshi', '9876543254', '9876543255', 'MNC', 1),
('23MEB0A46', 'Kunal Mishra', '9876543255', '9876543254', 'ME', 2),
('23MMEB0B47', 'Sneha Agarwal', '9876543256', '9876543253', 'MME', 3),
('22CEB0A48', 'Rudra Sharma', '9876543257', '9876543252', 'CE', 4),
('21CSB0B49', 'Diya Mehta', '9876543258', '9876543251', 'CSE', 1),
('24EEB0A50', 'Shaurya Patel', '9876543259', '9876543250', 'EEE', 2);

-- WARDEN Table
INSERT INTO WARDEN (Prof_id, Name, Contact_no_1, Contact_no_2, Mess_id) VALUES
('P_01', 'Prof. Ravi Kumar', '9999990001', '9999990002', 1),
('P_02', 'Prof. Sneha Iyer', '9999990003', '9999990004', 2),
('P_03', 'Prof. A.K. Sharma', '9999990005', '9999990006', 3),
('P_04', 'Prof. Neha Verma', '9999990007', '9999990008', 4);

-- WORKERS Table
INSERT INTO WORKERS (id, Name, Role, Contact_no_1, Contact_no_2, Mess_id) VALUES
(1, 'Ramu Das', 'cooking', '8888880001', '8888880002', 1),
(2, 'Shyam Lal', 'serving', '8888880003', '8888880004', 1),
(3, 'Mohan Sahu', 'manager', '8888880005', '8888880006', 1),
(4, 'Sita Bai', 'cleaner', '8888880007', '8888880008', 1),
(5, 'Geeta Rani', 'cooking', '8888880009', '8888880010', 2),
(6, 'Ravi Kant', 'serving', '8888880011', '8888880012', 2),
(7, 'Nisha Lal', 'manager', '8888880013', '8888880014', 2),
(8, 'Anil Chauhan', 'cleaner', '8888880015', '8888880016', 2),
(9, 'Meena Kumari', 'cooking', '8888880017', '8888880018', 3),
(10, 'Suraj Yadav', 'serving', '8888880019', '8888880020', 3),
(11, 'Dinesh Rao', 'manager', '8888880021', '8888880022', 3),
(12, 'Kamla Devi', 'cleaner', '8888880023', '8888880024', 3),
(13, 'Aarti Shah', 'cooking', '8888880025', '8888880026', 4),
(14, 'Rajeev Singh', 'serving', '8888880027', '8888880028', 4),
(15, 'Preeti Kaur', 'manager', '8888880029', '8888880030', 4),
(16, 'Manoj Pandey', 'cleaner', '8888880031', '8888880032', 4);

-- REPRESENTATIVES
INSERT INTO REPRESENTATIVES (Roll_no, Name, Role, Mess_id) VALUES
('23CSB0B01', 'Aditya Mehta', 'general', 1),
('24MNCB0B05', 'Jhanvi Verma', 'menu', 1),
('21CSB0B09', 'Sneha Desai', 'wastage', 1),
('24MNCB0B13', 'Aishwarya Goyal', 'feedback', 1),
('23EEB0A02', 'Vihaan Sharma', 'general', 2),
('23MEB0A06', 'Shaurya Patel', 'menu', 2),
('24EEB0A10', 'Manav Singh', 'wastage', 2),
('23MEB0A14', 'Parth Kapoor', 'feedback', 2),
('22ECB0B03', 'Ira Mishra', 'general', 3),
('23MMEB0B07', 'Ritika Yadav', 'menu', 3),
('23ECB0B11', 'Meera Naik', 'wastage', 3),
('23MMEB0B15', 'Nisha Menon', 'feedback', 3),
('21BTB0A04', 'Anaya Reddy', 'general', 4),
('22CEB0A08', 'Ayaan Joshi', 'menu', 4),
('22BTB0A12', 'Dev Saxena', 'wastage', 4),
('22CEB0A16', 'Yash Pillai', 'feedback', 4);

-- PAYMENT Table
INSERT INTO PAYMENT (Transaction_id, Amount, Date, Roll_number, Vendor_id) VALUES
('000001', 15000.00, '2024-01-15', '23CSB0B01', 100),
('000002', 15000.00, '2024-01-18', '23EEB0A02', 100),
('000003', 15000.00, '2024-02-05', '22ECB0B03', 101),
('000004', 15000.00, '2024-02-10', '21BTB0A04', 101),
('000005', 15000.00, '2024-02-12', '24MNCB0B05', 100),
('000006', 15000.00, '2024-03-01', '23MEB0A06', 100),
('000007', 15000.00, '2024-03-10', '23MMEB0B07', 101),
('000008', 15000.00, '2024-03-15', '22CEB0A08', 101),
('000009', 15000.00, '2024-04-02', '21CSB0B09', 100),
('000010', 15000.00, '2024-04-10', '24EEB0A10', 100),
('000011', 15000.00, '2024-04-18', '23ECB0B11', 101),
('000012', 15000.00, '2024-05-01', '22BTB0A12', 101),
('000013', 15000.00, '2024-05-12', '24MNCB0B13', 100),
('000014', 15000.00, '2024-05-20', '23MEB0A14', 100),
('000015', 15000.00, '2024-06-05', '23MMEB0B15', 101),
('000016', 15000.00, '2024-06-12', '22CEB0A16', 101),
('000017', 15000.00, '2024-06-20', '21CSB0B17', 100),
('000018', 15000.00, '2024-07-02', '24EEB0A18', 100),
('000019', 15000.00, '2024-07-10', '23ECB0B19', 101),
('000020', 15000.00, '2024-07-18', '22BTB0A20', 101),
('000021', 15000.00, '2024-08-01', '24MNCB0B21', 100),
('000022', 15000.00, '2024-08-12', '23MEB0A22', 100),
('000023', 15000.00, '2024-08-20', '23MMEB0B23', 101),
('000024', 15000.00, '2024-09-01', '22CEB0A24', 101),
('000025', 15000.00, '2024-09-10', '21CSB0B25', 100),
('000026', 15000.00, '2024-09-15', '24EEB0A26', 100),
('000027', 15000.00, '2024-09-22', '23ECB0B27', 101),
('000028', 15000.00, '2024-10-01', '22BTB0A28', 101),
('000029', 15000.00, '2024-10-05', '24MNCB0B29', 100),
('000030', 15000.00, '2024-10-12', '23MEB0A30', 100),
('000031', 15000.00, '2024-10-15', '23MMEB0B31', 101),
('000032', 15000.00, '2024-10-20', '22CEB0A32', 101),
('000033', 15000.00, '2024-11-01', '21CSB0B33', 100),
('000034', 15000.00, '2024-11-05', '24EEB0A34', 100),
('000035', 15000.00, '2024-11-10', '23ECB0B35', 101),
('000036', 15000.00, '2024-11-15', '22BTB0A36', 101),
('000037', 15000.00, '2024-11-20', '24MNCB0B37', 100),
('000038', 15000.00, '2024-11-25', '23MEB0A38', 100),
('000039', 15000.00, '2024-12-01', '23MMEB0B39', 101),
('000040', 15000.00, '2024-12-05', '22CEB0A40', 101),
('000041', 15000.00, '2024-12-10', '21CSB0B41', 100),
('000042', 15000.00, '2024-12-15', '24EEB0A42', 100),
('000043', 15000.00, '2024-12-20', '23ECB0B43', 101),
('000044', 15000.00, '2024-12-22', '22BTB0A44', 101),
('000045', 15000.00, '2024-12-24', '24MNCB0B45', 100),
('000046', 15000.00, '2024-12-26', '23MEB0A46', 100),
('000047', 15000.00, '2024-12-28', '23MMEB0B47', 101),
('000048', 15000.00, '2024-12-29', '22CEB0A48', 101),
('000049', 15000.00, '2024-12-30', '21CSB0B49', 100),
('000050', 15000.00, '2024-12-31', '24EEB0A50', 100);

INSERT INTO FEEDBACK (Feedback_no, Roll_number, Mess_id, Rating, Comments) VALUES
(1, '23CSB0B01', 1, 4, 'Good food quality, but could improve variety.'),
(1, '23EEB0A02', 2, 5, 'Excellent service and hygiene.'),
(1, '22ECB0B03', 3, 3, 'Average taste, sometimes late serving.'),
(1, '21BTB0A04', 4, 2, 'Needs improvement in cleanliness.'),
(2, '24MNCB0B05', 1, 5, 'Loved the menu options!'),
(2, '23MEB0A06', 2, 4, 'Good, but portion sizes could be bigger.'),
(2, '23MMEB0B07', 3, 3, 'Mess staff are polite but food is bland.'),
(2, '22CEB0A08', 4, 4, 'Nice ambience and decent food.'),
(3, '21CSB0B09', 1, 2, 'Mess is noisy during dinner time.'),
(3, '24EEB0A10', 2, 5, 'Fresh vegetables and clean setup.'),
(3, '23ECB0B11', 3, 3, 'Sometimes food is cold on serving.'),
(3, '22BTB0A12', 4, 4, 'Good experience overall.'),
(4, '24MNCB0B13', 1, 5, 'Very satisfied with the service.'),
(4, '23MEB0A14', 2, 4, 'Could add more variety to desserts.'),
(4, '23MMEB0B15', 3, 3, 'Food is okay but waits are long.'),
(4, '22CEB0A16', 4, 2, 'Mess facilities need repair.'),
(5, '21CSB0B17', 1, 4, 'Good hygiene, tasty meals.'),
(5, '24EEB0A18', 2, 5, 'Perfect balance of taste and quantity.'),
(5, '23ECB0B19', 3, 3, 'Average cleanliness and taste.'),
(5, '22BTB0A20', 4, 4, 'Staff are cooperative and helpful.');

-- SPECIAL DINNER Table
INSERT INTO SPECIAL_DINNER (Mess_id, Number, Date, Theme) VALUES
(1, 1, '2024-08-01', 'Sem Start'),
(1, 2, '2024-12-15', 'Winter Days'),
(2, 1, '2024-08-01', 'Sem Start'),
(2, 2, '2024-12-15', 'Winter Days'),
(3, 1, '2024-08-01', 'Sem Start'),
(3, 2, '2024-12-15', 'Winter Days'),
(4, 1, '2024-08-01', 'Sem Start'),
(4, 2, '2024-12-15', 'Winter Days');

-- MENU TABLE
-- Mess 1: IFC A
INSERT INTO DAILY_MENU (Mess_id, Day, ItemId, DishName, Category, MealType) VALUES
(1, 'Monday', 1, 'Paneer Butter Masala', 'Vegetarian', 'Lunch'),
(1, 'Monday', 2, 'Jeera Rice', 'Vegetarian', 'Lunch'),
(1, 'Monday', 3, 'Dal Tadka', 'Vegetarian', 'Lunch'),
(1, 'Monday', 4, 'Gulab Jamun', 'Dessert', 'Dinner'),
(1, 'Tuesday', 1, 'Chicken Curry', 'Non-Vegetarian', 'Lunch'),
(1, 'Tuesday', 2, 'Chapati', 'Vegetarian', 'Lunch'),
(1, 'Tuesday', 3, 'Mix Veg', 'Vegetarian', 'Lunch'),
(1, 'Tuesday', 4, 'Kheer', 'Dessert', 'Dinner'),
-- Mess 2: IFC B
(2, 'Monday', 1, 'Chole Masala', 'Vegetarian', 'Lunch'),
(2, 'Monday', 2, 'Bhature', 'Vegetarian', 'Lunch'),
(2, 'Monday', 3, 'Raita', 'Vegetarian', 'Lunch'),
(2, 'Monday', 4, 'Ras Malai', 'Dessert', 'Dinner'),
(2, 'Tuesday', 1, 'Fish Curry', 'Non-Vegetarian', 'Lunch'),
(2, 'Tuesday', 2, 'Rice', 'Vegetarian', 'Lunch'),
(2, 'Tuesday', 3, 'Saag Paneer', 'Vegetarian', 'Lunch'),
(2, 'Tuesday', 4, 'Jalebi', 'Dessert', 'Dinner'),
-- Mess 3: IFC C
(3, 'Monday', 1, 'Aloo Gobi', 'Vegetarian', 'Lunch'),
(3, 'Monday', 2, 'Paratha', 'Vegetarian', 'Lunch'),
(3, 'Monday', 3, 'Dal Fry', 'Vegetarian', 'Lunch'),
(3, 'Monday', 4, 'Ice Cream', 'Dessert', 'Dinner'),
(3, 'Tuesday', 1, 'Mutton Curry', 'Non-Vegetarian', 'Lunch'),
(3, 'Tuesday', 2, 'Naan', 'Vegetarian', 'Lunch'),
(3, 'Tuesday', 3, 'Mixed Veg', 'Vegetarian', 'Lunch'),
(3, 'Tuesday', 4, 'Fruit Custard', 'Dessert', 'Dinner'),
-- Mess 4: IFC D
(4, 'Monday', 1, 'Rajma Masala', 'Vegetarian', 'Lunch'),
(4, 'Monday', 2, 'Rice', 'Vegetarian', 'Lunch'),
(4, 'Monday', 3, 'Salad', 'Vegetarian', 'Lunch'),
(4, 'Monday', 4, 'Sweet Rice', 'Dessert', 'Dinner'),
(4, 'Tuesday', 1, 'Egg Curry', 'Non-Vegetarian', 'Lunch'),
(4, 'Tuesday', 2, 'Chapati', 'Vegetarian', 'Lunch'),
(4, 'Tuesday', 3, 'Palak Paneer', 'Vegetarian', 'Lunch'),
(4, 'Tuesday', 4, 'Rabri', 'Dessert', 'Dinner');
