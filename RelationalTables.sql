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
    Comments TEXT,
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