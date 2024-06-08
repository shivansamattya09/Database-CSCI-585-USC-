--https://livesql.oracle.com/;
-- Employee Table
CREATE TABLE Employee (
    ID INT PRIMARY KEY,
    name VARCHAR(255),
    office_number INT,
    age INT,
    floor_number INT CHECK (floor_number BETWEEN 1 AND 10),
    phone_number VARCHAR(15),
    email_address VARCHAR(255),
    address VARCHAR(255)
);
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (1, 'Michael', 1, 30, 1, '213-438-0101', 'Michae@email.com', '123 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (2, 'Emily', 2, 25, 2, '213-438-0102', 'Emily@email.com', '124 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (3, 'James', 3, 28, 3, '213-438-0103', 'James@email.com', '125 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (4, 'Jennifer', 4, 40, 4, '213-438-0104', 'Jennifer@email.com', '126 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (5, 'John', 5, 22, 5, '213-438-0105', 'John@email.com', '127 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (6, 'Ashley', 6, 31, 6, '213-438-0106', 'Ashley@email.com', '128 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (7, 'Edward', 7, 27, 7, '213-438-0107', 'edward.@email.com', '129 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (8, 'Green', 8, 29, 8, '213-438-0108', 'green@email.com', '130 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (9, 'George ', 9, 35, 9, '213-438-0109', 'george.@email.com', '131 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (10, 'Martin', 10, 26, 10, '213-438-0110', 'martin@email.com', '132 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (11, 'Ivan ', 11, 33, 1, '213-438-0111', 'ivan@email.com', '133 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (12, 'Jenny ', 12, 29, 2, '213-438-0112', 'jenny@email.com', '134 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (13, 'Rodriguez', 13, 37, 3, '213-438-0113', 'rodriguez@email.com', '135 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (14, 'Ashley', 14, 24, 1, '213-438-0114', 'Ashley@email.com', '136 ellandale St');
INSERT INTO Employee (ID, name, office_number, age, floor_number, phone_number, email_address, address) VALUES (15, 'Wilson', 15, 32, 5, '213-438-0115', 'wilson@email.com', '137 ellandale St');

select * from Employee;

-- Meeting Table
CREATE TABLE Meeting (
    meeting_ID INT PRIMARY KEY,
    employee_ID INT REFERENCES Employee(ID),
    room_number INT,
    floor_number INT CHECK (floor_number BETWEEN 1 AND 10),
    meeting_start_time INT CHECK (meeting_start_time BETWEEN 8 AND 18)
);

INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (1, 1, 301, 3, 9);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (2, 2, 302, 3, 10);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (3, 3, 303, 3, 11);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (4, 4, 301, 2, 14);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (5, 5, 304, 3, 8);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (6, 6, 305, 1, 15);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (7, 7, 306, 4, 12);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (8, 8, 302, 5, 16);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (9, 9, 307, 6, 17);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (10, 10, 308, 3, 18);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (11, 11, 309, 7, 13);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (12, 12, 301, 3, 9);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (13, 13, 310, 8, 8);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (14, 14, 311, 9, 14);
INSERT INTO Meeting (meeting_ID, employee_ID, room_number, floor_number, meeting_start_time) VALUES (15, 15, 312, 10, 10);

select * from Meeting;

-- Notification Table
CREATE TABLE Notification (
    notification_ID INT PRIMARY KEY,
    employee_ID INT REFERENCES Employee(ID),
    notification_date DATE,
    notification_type VARCHAR(10) CHECK (notification_type IN ('mandatory', 'optional'))
);

INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (1, 1, TO_DATE ('2023-10-01', 'YYYY-MM-DD'), 'mandatory');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (2, 2, TO_DATE ('2023-10-02', 'YYYY-MM-DD'),'optional');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (3, 3, TO_DATE ('2023-10-03', 'YYYY-MM-DD'),'mandatory');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (4, 4, TO_DATE ('2023-10-04', 'YYYY-MM-DD'),'optional');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (5, 5, TO_DATE ('2023-10-05','YYYY-MM-DD'),'mandatory');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (6, 6, TO_DATE ('2023-10-06','YYYY-MM-DD'), 'optional');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (7, 7, TO_DATE ('2023-10-07', 'YYYY-MM-DD'),'mandatory');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (8, 8, TO_DATE ('2023-10-08', 'YYYY-MM-DD'),'optional');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (9, 9, TO_DATE ('2023-10-09', 'YYYY-MM-DD'),'mandatory');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (10, 10, TO_DATE ('2023-10-10','YYYY-MM-DD'), 'optional');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (11, 11, TO_DATE ('2023-10-11','YYYY-MM-DD'), 'mandatory');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (12, 12, TO_DATE ('2023-10-12','YYYY-MM-DD'), 'optional');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (13, 13, TO_DATE ('2023-10-13','YYYY-MM-DD'), 'mandatory');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (14, 14, TO_DATE ('2023-10-14','YYYY-MM-DD'),'optional');
INSERT INTO Notification (notification_ID, employee_ID, notification_date, notification_type) VALUES (15, 15, TO_DATE ('2023-10-15','YYYY-MM-DD'), 'mandatory');

select * from Notification ;

-- Symptom Table
CREATE TABLE Symptom (
    row_ID INT PRIMARY KEY,
    employee_ID INT REFERENCES Employee(ID),
    date_reported DATE,
    symptom_ID INT CHECK (symptom_ID BETWEEN 0 AND 5)
);

INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (1, 1, TO_DATE ('2023-10-01','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (2, 2, TO_DATE ('2023-10-01','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (3, 3, TO_DATE ('2023-10-02','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (4, 4, TO_DATE ('2023-10-02','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (5, 5, TO_DATE ('2023-10-03','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (6, 6, TO_DATE ('2023-10-03','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (7, 7, TO_DATE ('2023-10-04','YYYY-MM-DD'),2);
INSERT INTO Symptom (row_ID, employee_ID, date_reported,symptom_ID) VALUES (8, 8, TO_DATE ('2023-10-04','YYYY-MM-DD'),3);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (9, 9, TO_DATE ('2023-10-05', 'YYYY-MM-DD'),4);
INSERT INTO Symptom (row_ID, employee_ID, date_reported,symptom_ID) VALUES (10, 10, TO_DATE ('2023-10-05','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported,symptom_ID) VALUES (11, 11, TO_DATE ('2023-10-06','YYYY-MM-DD'),1);
INSERT INTO Symptom (row_ID, employee_ID, date_reported, symptom_ID) VALUES (12, 12, TO_DATE ('2023-10-06','YYYY-MM-DD'),2);
INSERT INTO Symptom (row_ID, employee_ID, date_reported,symptom_ID) VALUES (13, 13, TO_DATE ('2023-10-07','YYYY-MM-DD'),3);
INSERT INTO Symptom (row_ID, employee_ID, date_reported,symptom_ID) VALUES (14, 14, TO_DATE ('2023-10-07','YYYY-MM-DD'),4);
INSERT INTO Symptom (row_ID, employee_ID, date_reported,symptom_ID) VALUES (15, 15, TO_DATE ('2023-10-08','YYYY-MM-DD'),5);

select * from Symptom ;

-- Scan Table
CREATE TABLE Scan (
    scan_ID INT PRIMARY KEY,
    scan_date DATE,
    scan_time INT CHECK (scan_time BETWEEN 0 AND 23),
    employee_ID INT REFERENCES Employee(ID),
    temperature FLOAT
);

INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (1, TO_DATE ('2023-10-01','YYYY-MM-DD'),9, 1, 98.6);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (2, TO_DATE ('2023-10-01','YYYY-MM-DD'),10, 2, 99.5);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (3, TO_DATE ('2023-10-02','YYYY-MM-DD'),11, 3, 98.4);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (4, TO_DATE ('2023-10-02','YYYY-MM-DD'),14, 4, 101.1);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (5, TO_DATE ('2023-10-03','YYYY-MM-DD'),8, 5, 98.6);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (6, TO_DATE ('2023-10-03','YYYY-MM-DD'),16, 6, 98.7);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (7, TO_DATE ('2023-10-04','YYYY-MM-DD'),12, 7, 98.9);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (8, TO_DATE ('2023-10-04','YYYY-MM-DD'),15, 8, 102.2);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (9, TO_DATE ('2023-10-05','YYYY-MM-DD'),9, 9, 98.5);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (10, TO_DATE ('2023-10-05','YYYY-MM-DD'),17, 10, 99.8);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (11, TO_DATE ('2023-10-06','YYYY-MM-DD'),10, 11, 98.3);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (12, TO_DATE ('2023-10-06','YYYY-MM-DD'),11, 12, 100.5);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (13, TO_DATE ('2023-10-07','YYYY-MM-DD'),14, 13, 98.8);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (14, TO_DATE ('2023-10-07','YYYY-MM-DD'),15, 14, 101.4);
INSERT INTO Scan (scan_ID, scan_date, scan_time, employee_ID, temperature) VALUES (15, TO_DATE ('2023-10-08','YYYY-MM-DD'),9, 15, 98.7);

select * from Scan ;

-- Test Table
CREATE TABLE Test (
    test_ID INT PRIMARY KEY,
    location VARCHAR(50) CHECK (location IN ('company', 'hospital', 'clinic')),
    test_date DATE,
    test_time INT CHECK (test_time BETWEEN 0 AND 23),
    employee_ID INT REFERENCES Employee(ID),
    test_result VARCHAR(10) CHECK (test_result IN ('positive', 'negative'))
);

INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (1, 'company', TO_DATE ('2023-10-01', 'YYYY-MM-DD') ,10, 1, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (2, 'hospital', TO_DATE ('2023-10-01', 'YYYY-MM-DD'),11, 2, 'positive');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (3, 'clinic', TO_DATE ('2023-10-02','YYYY-MM-DD'), 14, 3, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (4, 'company', TO_DATE ('2023-10-02','YYYY-MM-DD'), 15, 4, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (5, 'hospital', TO_DATE ('2023-10-03','YYYY-MM-DD'), 9, 5, 'positive');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (6, 'clinic', TO_DATE ('2023-10-03','YYYY-MM-DD'), 16, 6, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (7, 'company', TO_DATE ('2023-10-04','YYYY-MM-DD'), 12, 7, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (8, 'hospital', TO_DATE ('2023-10-04','YYYY-MM-DD'), 14, 8, 'positive');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (9, 'clinic', TO_DATE ('2023-10-05','YYYY-MM-DD'), 10, 9, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (10, 'company', TO_DATE ('2023-10-05','YYYY-MM-DD'),11, 10, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (11, 'hospital', TO_DATE ('2023-10-06','YYYY-MM-DD'), 13, 11, 'positive');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (12, 'clinic', TO_DATE ('2023-10-06','YYYY-MM-DD'), 14, 12, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (13, 'company', TO_DATE ('2023-10-07','YYYY-MM-DD'), 15, 13, 'negative');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (14, 'hospital', TO_DATE ('2023-10-07','YYYY-MM-DD'), 16, 14, 'positive');
INSERT INTO Test (test_ID, location, test_date, test_time, employee_ID, test_result) VALUES (15, 'clinic', TO_DATE ('2023-10-08','YYYY-MM-DD'), 9, 15, 'negative');

select * from Test ;

-- Case Table
CREATE TABLE "Case" (
    case_ID INT PRIMARY KEY,
    employee_ID INT REFERENCES Employee(ID),
    "date" DATE,
    resolution VARCHAR(50) CHECK (resolution IN ('back to work', 'left the company', 'deceased'))
);

INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (1, 1, TO_DATE ('2023-10-01','YYYY-MM-DD') ,'back to work');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (2, 2, TO_DATE ('2023-10-02', 'YYYY-MM-DD'),'left the company');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (3, 3, TO_DATE ('2023-10-03','YYYY-MM-DD') ,'back to work');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (4, 4, TO_DATE ('2023-10-04','YYYY-MM-DD'),'deceased');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (5, 5, TO_DATE ('2023-10-05','YYYY-MM-DD'),'back to work');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (6, 6, TO_DATE ('2023-10-06','YYYY-MM-DD'), 'left the company');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (7, 7, TO_DATE ('2023-10-07','YYYY-MM-DD'), 'back to work');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (8, 8, TO_DATE ('2023-10-08','YYYY-MM-DD'), 'left the company');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (9, 9, TO_DATE ('2023-10-09', 'YYYY-MM-DD'),'back to work');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (10, 10, TO_DATE ('2023-10-10','YYYY-MM-DD'), 'deceased');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (11, 11, TO_DATE ('2023-10-11','YYYY-MM-DD'), 'back to work');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (12, 12, TO_DATE ('2023-10-12','YYYY-MM-DD'), 'left the company');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (13, 13, TO_DATE ('2023-10-13','YYYY-MM-DD'), 'back to work');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (14, 14, TO_DATE ('2023-10-14','YYYY-MM-DD'), 'deceased');
INSERT INTO "Case" (case_ID, employee_ID, "date", resolution) VALUES (15, 15, TO_DATE ('2023-10-15','YYYY-MM-DD'),'back to work');

select * from "Case" ;


-- HealthStatus Table
CREATE TABLE HealthStatus (
    row_ID INT PRIMARY KEY,
    employee_ID INT REFERENCES Employee(ID),
    "date" DATE,
    status VARCHAR(15) CHECK (status IN ('sick', 'hospitalized', 'well'))
);

INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (1, 1, TO_DATE ('2023-10-01', 'YYYY-MM-DD'),'sick');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (2, 2, TO_DATE ('2023-10-02','YYYY-MM-DD') ,'well');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (3, 3, TO_DATE ('2023-10-03','YYYY-MM-DD') ,'hospitalized');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (4, 4, TO_DATE ('2023-10-04','YYYY-MM-DD') ,'sick');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (5, 5, TO_DATE ('2023-10-05','YYYY-MM-DD') ,'well');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (6, 6, TO_DATE ('2023-10-06','YYYY-MM-DD') ,'hospitalized');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (7, 7, TO_DATE ('2023-10-07', 'YYYY-MM-DD'),'sick');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (8, 8, TO_DATE ('2023-10-08', 'YYYY-MM-DD'),'well');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (9, 9, TO_DATE ('2023-10-09','YYYY-MM-DD'), 'hospitalized');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (10, 10, TO_DATE ('2023-10-10','YYYY-MM-DD'), 'sick');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (11, 11, TO_DATE ('2023-10-11','YYYY-MM-DD'), 'sick');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (12, 12, TO_DATE ('2023-10-12','YYYY-MM-DD') ,'hospitalized');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (13, 13, TO_DATE ('2023-10-13', 'YYYY-MM-DD'),'sick');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (14, 14, TO_DATE ('2023-10-14', 'YYYY-MM-DD'),'sick');
INSERT INTO HealthStatus (row_ID, employee_ID, "date", status) VALUES (15, 15, TO_DATE ('2023-10-15','YYYY-MM-DD'),'hospitalized');

select * from HealthStatus ;