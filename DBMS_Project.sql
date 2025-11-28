-- GONZO's HD SPORTS Database
-- By: Jaedon McClendon, Jessie Rosas, Bolu Afariogun, John Gonsalves

CREATE DATABASE DBMS_Project;
USE DBMS_Project;

CREATE TABLE CUSTOMER(
    cust_id     			VARCHAR(5) PRIMARY KEY,
    cust_name   			VARCHAR(30),
    phone_num   			VARCHAR(30),
    email       			VARCHAR(60),
    discount_eligibility	BOOL
);

CREATE TABLE SIMULATOR(
    sim_id      VARCHAR(5) PRIMARY KEY,
    sport_type  VARCHAR(30),
    sim_name    VARCHAR(50)
);

CREATE TABLE TIMESLOT(
    slot_id     VARCHAR(5) PRIMARY KEY,
    start_time  VARCHAR(10),
    duration    INT,
    price       INT
);

CREATE TABLE BOOKINGS(
    book_id     VARCHAR(5) PRIMARY KEY,
    book_date    DATE,

    cust_id     VARCHAR(5),
    sim_id      VARCHAR(5),
    slot_id     VARCHAR(5),
    final_price INT, -- DEVIATED FROM SCHEMA

    FOREIGN KEY (cust_id) REFERENCES CUSTOMER(cust_id),
    FOREIGN KEY (sim_id) REFERENCES SIMULATOR(sim_id),
    FOREIGN KEY (slot_id) REFERENCES TIMESLOT(slot_id),

    -- Prevent double booking
    UNIQUE (sim_id, slot_id, book_date)
);


-- INSERTS
INSERT INTO CUSTOMER VALUES 
('C001', 'John Carter', '410-555-2938', 'johncarter@mail.com', TRUE),
('C002', 'Emily Stone', '443-555-1844', 'emstone@mail.com', FALSE),
('C003', 'Marcus Lee', '301-555-9090', 'mlee@mail.com', TRUE),
('C004', 'Sarah Nguyen', '202-555-7345', 'sarahng@mail.com', FALSE),
('C005', 'David Kim', '410-555-1500', 'dkim@mail.com', TRUE);


INSERT INTO SIMULATOR VALUES
('S01', 'Golf', 'Full Swing Pro Max'),
('S02', 'Basketball', 'HoopMaster Elite'),
('S03', 'Football', 'QB Vision Trainer'),
('S04', 'Baseball', 'PitchSpeed Pro'),
('S05', 'Soccer', 'GoalZone Trainer');


INSERT INTO TIMESLOT VALUES
('T01', '10:00', 60, 40),
('T02', '11:00', 60, 50),
('T03', '12:00', 60, 35),
('T04', '13:00', 30, 25),
('T05', '14:00', 90, 55);

