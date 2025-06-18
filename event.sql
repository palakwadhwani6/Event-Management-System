create database EM ;
use EM ;
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(255),
    Location VARCHAR(255),
    ContactNumber VARCHAR(20),
    Email VARCHAR(255)
);
CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LNAME VARCHAR(255),
    ContactNumber VARCHAR(20),
    Email VARCHAR(255),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    SName VARCHAR(255),
    Designation VARCHAR(255),
    ContactNumber VARCHAR(20),
    Email VARCHAR(255)
);
CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255),
    Date DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

ALTER TABLE Events MODIFY COLUMN EventID INT AUTO_INCREMENT;

-- Step 1: Drop the foreign key constraint
ALTER TABLE eventbranch DROP FOREIGN KEY eventbranch_ibfk_1;

-- Step 2: Modify the column in the primary table
ALTER TABLE Events MODIFY COLUMN EventID INT AUTO_INCREMENT;

-- Step 3: Recreate the foreign key constraint
ALTER TABLE eventbranch ADD CONSTRAINT eventbranch_ibfk_1 FOREIGN KEY (EventID) REFERENCES Events(EventID);


CREATE TABLE Facilities (
    FacilityID INT PRIMARY KEY,
    FacilityName VARCHAR(255),
    Availability ENUM('YES', 'NO')
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    Amount DECIMAL(10, 2), -- Assuming a maximum of 10 digits with 2 decimal places
    PaymentDate DATE
);

# after normalization

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LName VARCHAR(255),
    ContactNumber VARCHAR(20),
    Email VARCHAR(255),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE BranchLocation (
    BranchID INT,
    LocationID INT,
    PRIMARY KEY (BranchID, LocationID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    SName VARCHAR(255),
    Designation VARCHAR(255),
    ContactNumber VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255),
    Date DATE
);

CREATE TABLE EventBranch (
    EventID INT,
    BranchID INT,
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    PRIMARY KEY (EventID, BranchID)
);

CREATE TABLE Facilities (
    FacilityID INT PRIMARY KEY,
    FacilityName VARCHAR(255),
    Availability ENUM('YES', 'NO')
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    Amount DECIMAL(10, 2),
    PaymentDate DATE
);

INSERT INTO Branch (BranchID, BranchName, Email) VALUES
    (1, 'Indore', 'indore@example.com'),
    (2, 'Mumbai', 'mumbai@example.com'),
    (3, 'Pune', 'pune@example.com'),
    (4, 'Delhi', 'delhi@example.com'),
    (5, 'Goa', 'goa@example.com');

INSERT INTO Location (LocationID, LName, ContactNumber, Email, BranchID) VALUES
    (1, 'Location 1', '+1234567890', 'location1@example.com', 1), 
    (2, 'Location 2', '+1234567891', 'location2@example.com', 2), 
    (3, 'Location 3', '+1234567892', 'location3@example.com', 3), 
    (4, 'Location 4', '+1234567893', 'location4@example.com', 4), 
    (5, 'Location 5', '+1234567894', 'location5@example.com', 5), 
	(6, 'Location 6', '+1234567895', 'location6@example.com', 1),   
    (7, 'Location 7', '+1234567896', 'location7@example.com', 1),  
    (8, 'Location 8', '+1234567897', 'location8@example.com', 2), 
    (9, 'Location 9', '+1234567898', 'location9@example.com', 2),
    (10, 'Location 10', '+1234567899', 'location10@example.com', 3),
    (11, 'Location 11', '+1234567800', 'location11@example.com', 3),
    (12, 'Location 12', '+1234567801', 'location12@example.com', 4),
    (13, 'Location 13', '+1234567802', 'location13@example.com', 4),
    (14, 'Location 14', '+1234567803', 'location14@example.com', 5),
    (15, 'Location 15', '+1234567804', 'location15@example.com', 5),
    (16, 'Location 16', '+1234567805', 'location16@example.com', 1),
    (17, 'Location 17', '+1234567806', 'location17@example.com', 2),
    (18, 'Location 18', '+1234567807', 'location18@example.com', 3),
    (19, 'Location 19', '+1234567808', 'location19@example.com', 4),
    (20, 'Location 20', '+1234567809', 'location20@example.com', 5);
    
INSERT INTO BranchLocation (BranchID, LocationID) VALUES
    (1, 1),   
    (1, 2),   
    (2, 3),  
    (2, 4),   
    (3, 5), 
    (3, 6),   
    (4, 7),  
    (4, 8),   
    (5, 9), 
    (5, 10),  
    (1, 16), 
    (2, 17),  
    (3, 18), 
    (4, 19),  
    (5, 20);  
  
INSERT INTO Staff (StaffID, SName, Designation, ContactNumber, Email) VALUES
    (1, 'John Doe', 'Event Manager', '+1234567890', 'john.doe@example.com'),
    (2, 'Jane Smith', 'Event Coordinator', '+1234567891', 'jane.smith@example.com'),
    (3, 'Alice Johnson', 'Event Planner', '+1234567892', 'alice.johnson@example.com'),
    (4, 'Bob Williams', 'Marketing Manager', '+1234567893', 'bob.williams@example.com'),
    (5, 'Emily Brown', 'Marketing Coordinator', '+1234567894', 'emily.brown@example.com');
    
INSERT INTO Events (EventID, EventName, Date) VALUES
    (1, 'Conference', '2024-04-10'),
    (2, 'Product Launch', '2024-05-15'),
    (3, 'Charity Gala', '2024-06-20'),
    (4, 'Corporate Retreat', '2024-07-25'),
    (5, 'Fashion Show', '2024-08-30'),
	(6, 'Music Festival', '2024-09-05'),
    (7, 'Tech Conference', '2024-10-10'),
    (8, 'Holiday Party', '2024-12-20'),
    (9, 'Annual Gala', '2025-02-14'),
    (10, 'Trade Show', '2025-03-30');
    
INSERT INTO EventBranch (EventID, BranchID) VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 3),
    (3, 4),
    (4, 5),
    (5, 1),
    (5, 2),
    (5, 3);
    
INSERT INTO Facilities (FacilityID, FacilityName, Availability) VALUES
(1, 'Projector', 'YES'),
(2, 'Microphone', 'YES'),
(3, 'Stage', 'NO'),
(4, 'Chairs', 'YES'),
(5, 'Tables', 'YES'),
(6, 'Sound System', 'YES'),
(7, 'Lighting Equipment', 'NO'),
(8, 'Podium', 'YES'),
(9, 'Dance Floor', 'YES'),
(10, 'Catering Services', 'YES');


INSERT INTO Payments (PaymentID, Amount, PaymentDate) VALUES
(6, 500.00, '2024-04-01'),
(7, 750.00, '2024-04-05'),
(8, 1000.00, '2024-04-10'),
(9, 1200.00, '2024-04-15'),
(10, 2000.00, '2024-04-20'),
(11, 1500.00, '2024-04-25'),
(12, 1800.00, '2024-04-30'),
(13, 2200.00, '2024-05-05'),
(14, 2500.00, '2024-05-10'),
(15, 3000.00, '2024-05-15');

    
#Branch Table: The BranchID appears to be a primary candidate key
#Location Table: The LocationID seems to be the primary candidate key
#Location Table: The LocationID seems to be the primary candidate key
#Events Table: The EventID appears to be the primary candidate key
#Facilities Table: The FacilityID is likely the primary candidate key
#Payments Table: The PaymentID seems to be the primary candidate key

#queries

#Retrieve the name and email of branches

SELECT BranchName, Email FROM Branch;

#Retrieve the branch names and their corresponding locations

SELECT b.BranchName, l.LName
FROM Branch b
JOIN BranchLocation bl ON b.BranchID = bl.BranchID
JOIN Location l ON bl.LocationID = l.LocationID;

#Retrieve the events and their associated branches:

SELECT e.EventName, b.BranchName
FROM Events e
JOIN EventBranch eb ON e.EventID = eb.EventID
JOIN Branch b ON eb.BranchID = b.BranchID;

# the total number of staff members:

SELECT COUNT(*) 
FROM Staff;

#Retrieve the locations with contact numbers:

SELECT *
FROM Location 
WHERE ContactNumber IS NOT NULL;

# Retrieve the names of branches along with their associated locations:

SELECT Branch.BranchName, Location.LName
FROM Branch
INNER JOIN BranchLocation ON Branch.BranchID = BranchLocation.BranchID
INNER JOIN Location ON BranchLocation.LocationID = Location.LocationID;



# Retrieve the average amount of payments

SELECT AVG(Amount) AS AveragePayment
FROM Payments;

# Retrieve all payments made after a certain date
SELECT *
FROM Payments
WHERE PaymentDate > '2024-04-15';

# Retrieve events with their corresponding branches and locations
SELECT e.EventName, b.BranchName, l.LName
FROM Events e
JOIN EventBranch eb ON e.EventID = eb.EventID
JOIN Branch b ON eb.BranchID = b.BranchID
JOIN BranchLocation bl ON b.BranchID = bl.BranchID
JOIN Location l ON bl.LocationID = l.LocationID;

# Retrieve all available facilities
SELECT *
FROM Facilities
WHERE Availability = 'YES';

# Retrieve the total amount of payments made
SELECT SUM(Amount) AS TotalPayments
FROM Payments;

# Retrieve the contact number and email of staff members
SELECT ContactNumber, Email
FROM Staff;

# Retrieve events with their respective branches sorted by date
SELECT e.EventName, b.BranchName, e.Date
FROM Events e
JOIN EventBranch eb ON e.EventID = eb.EventID
JOIN Branch b ON eb.BranchID = b.BranchID
ORDER BY e.Date;

# Retrieve branches with their total number of locations
SELECT b.BranchName, COUNT(bl.LocationID) AS TotalLocations
FROM Branch b
LEFT JOIN BranchLocation bl ON b.BranchID = bl.BranchID
GROUP BY b.BranchName;

# Retrieve events scheduled for a specific month

SELECT *
FROM Events
WHERE MONTH(Date) = 5; 

#Find the event with the highest payment amount:
SELECT e.EventName, MAX(p.Amount) AS HighestPaymentAmount
FROM Events e
JOIN Payments p ON e.EventID = p.PaymentID
GROUP BY e.EventName
ORDER BY MAX(p.Amount) DESC
LIMIT 1;

#What are the details of events, including event ID, name, date, total number of payments made, 
#and total payment amount, sorted in descending order by the total payment amount?"
SELECT e.EventID, e.EventName, e.Date, COUNT(p.PaymentID) AS TotalPayments, SUM(p.Amount) AS TotalPaymentAmount
FROM Events e
LEFT JOIN EventBranch eb ON e.EventID = eb.EventID
LEFT JOIN Payments p ON e.EventID = p.PaymentID
GROUP BY e.EventID, e.EventName, e.Date
ORDER BY TotalPaymentAmount DESC;

#Find the total amount paid for each event and the average payment amount per event:
SELECT e.EventID, e.EventName, SUM(p.Amount) AS TotalAmountPaid, AVG(p.Amount) AS AveragePaymentAmount
FROM Events e
LEFT JOIN Payments p ON e.EventID = p.PaymentID
GROUP BY e.EventID, e.EventName;

#List the facilities available at each branch along with their availability status
SELECT b.BranchName, f.FacilityName, f.Availability
FROM Branch b
JOIN BranchLocation bl ON b.BranchID = bl.BranchID
JOIN Location l ON bl.LocationID = l.LocationID
JOIN Facilities f ON l.LocationID = f.FacilityID;


#Retrieve the staff members assigned to each event along with their roles
SELECT e.EventName, s.SName, s.Designation
FROM Events e
JOIN EventBranch eb ON e.EventID = eb.EventID
JOIN Staff s ON e.EventID = s.StaffID;

SELECT  *  FROM events; 
