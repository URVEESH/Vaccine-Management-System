CREATE SCHEMA vaccine_management_system;

use vaccine_management_system;

CREATE TABLE HOSPITAL (
    H_Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Location VARCHAR(255),
    Contact VARCHAR(15)
);

CREATE TABLE DOCTOR (
    D_Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Contact VARCHAR(15),
    Specialisation VARCHAR(255),
    H_Id INT,
    FOREIGN KEY (H_Id) REFERENCES HOSPITAL (H_Id)
);

CREATE TABLE HEALTHCARE_SERVICE (
    D_Id INT,
    H_Id INT,
    Service_Duration VARCHAR(255),
    FOREIGN KEY (D_Id) REFERENCES DOCTOR (D_Id),
    FOREIGN KEY (H_Id) REFERENCES HOSPITAL (H_Id),
	PRIMARY KEY (D_Id,H_Id)
);

CREATE TABLE PHARMACEUTICAL_COMPANY (
    C_Id INT PRIMARY KEY,
    H_Id INT,
    Name VARCHAR(255),
    Contact VARCHAR(255),
    FOREIGN KEY (H_Id) REFERENCES HOSPITAL (H_Id)
);

CREATE TABLE VACCINE (
    V_Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Storage_Temperature VARCHAR(15),
    Manufacturer VARCHAR(255),
    Dosage INT,
    C_Id INT,
    FOREIGN KEY (C_Id) REFERENCES PHARMACEUTICAL_COMPANY (C_Id)
);

CREATE TABLE INVENTORY (
    I_Id VARCHAR(15) PRIMARY KEY,
    V_Id INT,
    H_Id INT,
    Quantity INT,
    Expiration_Date DATE,
    FOREIGN KEY (V_Id) REFERENCES VACCINE (V_Id),
    FOREIGN KEY (H_Id) REFERENCES HOSPITAL (H_Id)
);

CREATE TABLE RESEARCH_COMPANY (
    Rc_Id INT PRIMARY KEY,
    C_Id INT,
    Name VARCHAR(255),
    Contact VARCHAR(255),
    FOREIGN KEY (C_Id) REFERENCES PHARMACEUTICAL_COMPANY (C_Id)
);

CREATE TABLE PRIVATE_RESEARCH_LAB (
    Prl_Rc_Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Contact VARCHAR(255),
    FOREIGN KEY (Prl_Rc_Id) REFERENCES RESEARCH_COMPANY (Rc_Id)
);

CREATE TABLE MEDICAL_UNIVERSITIES (
    Mu_Rc_Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Contact VARCHAR(255),
    FOREIGN KEY (Mu_Rc_Id) REFERENCES RESEARCH_COMPANY (Rc_Id)
);

CREATE TABLE ORGANISATIONS_CAMPS (
    Org_Id INT PRIMARY KEY,
    Name VARCHAR(255),
    LOC VARCHAR(255)
);

CREATE TABLE INSURANCE_COMPANY (
    Insurance_Id INT PRIMARY KEY,
    Policy_No VARCHAR(15),
    Provider VARCHAR(255)
);

CREATE TABLE PERSON (
    P_Id INT PRIMARY KEY,
    Insurance_Id INT,
    Org_Id INT,
    H_Id INT,
    Adrs VARCHAR(255),
    Name VARCHAR(255),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    Vaccine_status VARCHAR(20),
    FOREIGN KEY (Org_Id) REFERENCES ORGANISATIONS_CAMPS (Org_Id),
    FOREIGN KEY (Insurance_Id) REFERENCES INSURANCE_COMPANY (Insurance_Id),
    FOREIGN KEY (H_Id) REFERENCES HOSPITAL (H_Id)
);

CREATE TABLE VACCINATED_BY (
    P_Id INT,
    V_Id INT,
    FOREIGN KEY (P_Id) REFERENCES PERSON (P_Id),
    FOREIGN KEY (V_Id) REFERENCES VACCINE (V_Id),
    PRIMARY KEY (P_Id,V_Id)
);

CREATE TABLE PRESCRIPTION_BY (
    P_Id INT,
    D_Id INT,
    FOREIGN KEY (P_Id) REFERENCES PERSON (P_Id),
    FOREIGN KEY (D_Id) REFERENCES DOCTOR (D_Id),
    PRIMARY KEY (P_Id,D_Id)
);


-- Inserting 10 random entries into the HOSPITAL table
INSERT INTO HOSPITAL (H_Id, Name, Location, Contact)
VALUES
    (101, 'New York General Hospital', 'New York, NY', '212-555-1234'),
    (102, 'Los Angeles Medical Center', 'Los Angeles, CA', '213-555-5678'),
    (103, 'Chicago Community Clinic', 'Chicago, IL', '312-555-9876'),
    (104, 'Houston Rural Hospital', 'Houston, TX', '713-555-8765'),
    (105, 'Miami Sunset Hospital', 'Miami, FL', '305-555-2345'),
    (106, 'San Francisco General Hospital', 'San Francisco, CA', '415-555-8765'),
    (107, 'Dallas Medical Center', 'Dallas, TX', '214-555-9876'),
    (108, 'Philadelphia Community Clinic', 'Philadelphia, PA', '215-555-3456'),
    (109, 'Seattle Coastal Hospital', 'Seattle, WA', '206-555-6789'),
    (110, 'Boston Memorial Hospital', 'Boston, MA', '617-555-4321');

-- Inserting 20 manual entries into the DOCTOR table
INSERT INTO DOCTOR (D_Id, Name, Contact, Specialisation, H_Id)
VALUES
    (1, 'Dr. Smith', '155-123-4567', 'Cardiologist', 101),
    (2, 'Dr. Johnson', '516-264-5678', 'Dermatologist', 102),
    (3, 'Dr. Williams', '125-345-6789', 'Gastroenterologist', 103),
    (4, 'Dr. Jones', '321-456-7890', 'Neurologist', 101),
    (5, 'Dr. Brown', '134-567-8901', 'Orthopedic Surgeon', 105),
    (6, 'Dr. Davis', '431-678-9012', 'Ophthalmologist', 105),
    (7, 'Dr. Miller', '555-789-0123', 'Pediatrician', 107),
    (8, 'Dr. Wilson', '555-890-1234', 'Psychiatrist', 108),
    (9, 'Dr. Moore', '655-901-2345', 'Radiologist', 109),
    (10, 'Dr. Taylor', '555-012-3456', 'Urologist', 110),
    (11, 'Dr. Clark', '555-163-4568', 'Cardiologist', 101),
    (12, 'Dr. Lee', '231-236-4312', 'Dermatologist', 102),
    (13, 'Dr. Hall', '123-345-6789', 'Gastroenterologist', 103),
    (14, 'Dr. Wright', '512-466-7890', 'Neurologist', 101),
    (15, 'Dr. Allen', '765-567-8901', 'Orthopedic Surgeon', 105),
    (16, 'Dr. White', '231-678-9012', 'Ophthalmologist', 106),
    (17, 'Dr. Harris', '981-789-0123', 'Pediatrician', 107),
    (18, 'Dr. Martin', '517-860-1234', 'Psychiatrist', 108),
    (19, 'Dr. King', '342-901-2345', 'Radiologist', 109),
    (20, 'Dr. Walker', '589-062-3456', 'Urologist', 109);

-- Inserting 20 manual entries into the HEALTHCARE_SERVICE table
INSERT INTO HEALTHCARE_SERVICE (D_Id, H_Id, Service_Duration)
VALUES
    (1, 101, '5 years'),
    (2, 102, '3 years'),
    (3, 103, '10 years'),
    (4, 104, '2 years'),
    (5, 105, '7 years'),
    (6, 106, '3 years'),
    (7, 107, '5 years'),
    (8, 108, '2 years'),
    (9, 109, '10 years'),
    (10, 109, '5 years'),
    (11, 109, '3 years'),
    (12, 102, '7 years'),
    (13, 103, '2 years'),
    (14, 103, '10 years'),
    (15, 105, '3 years'),
    (16, 106, '5 years'),
    (17, 102, '2 years'),
    (18, 101, '7 years'),
    (19, 109, '10 years'),
    (20, 109, '5 years');
    
    -- Inserting 30 entries into the PHARMACEUTICAL_COMPANY table
INSERT INTO PHARMACEUTICAL_COMPANY (C_Id, H_Id, Name, Contact)
VALUES
    (1001, 101, 'Pfizer', 'contact@pfizer.com'),
    (1002, 102, 'Johnson & Johnson', 'contact@jnj.com'),
    (1003, 103, 'Merck', 'contact@merck.com'),
    (1004, 104, 'Novartis', 'contact@novartis.com'),
    (1005, 105, 'Roche', 'contact@roche.com'),
    (1006, 106, 'GlaxoSmithKline', 'contact@gsk.com'),
    (1007, 107, 'AstraZeneca', 'contact@astrazeneca.com'),
    (1008, 108, 'Sanofi', 'contact@sanofi.com'),
    (1009, 109, 'Eli Lilly', 'contact@elililly.com'),
    (1010, 110, 'Abbott Laboratories', 'contact@abbott.com'),
    (1011, 101, 'Bristol-Myers Squibb', 'contact@bms.com'),
    (1012, 102, 'Gilead Sciences', 'contact@gilead.com'),
    (1013, 103, 'Amgen', 'contact@amgen.com'),
    (1014, 104, 'Biogen', 'contact@biogen.com'),
    (1015, 109, 'Genentech', 'contact@genentech.com'),
    (1016, 107, 'Mylan', 'contact@mylan.com'),
    (1017, 107, 'Teva Pharmaceuticals', 'contact@teva.com'),
    (1018, 108, 'Pfizer', 'contact@pfizer.com'),
    (1019, 109, 'Johnson & Johnson', 'contact@jnj.com'),
    (1020, 109, 'Merck', 'contact@merck.com'),
    (1021, 109, 'Novartis', 'contact@novartis.com'),
    (1022, 101, 'Roche', 'contact@roche.com'),
    (1023, 102, 'GlaxoSmithKline', 'contact@gsk.com'),
    (1024, 104, 'AstraZeneca', 'contact@astrazeneca.com'),
    (1025, 105, 'Sanofi', 'contact@sanofi.com'),
    (1026, 106, 'Eli Lilly', 'contact@elililly.com'),
    (1027, 107, 'Abbott Laboratories', 'contact@abbott.com'),
    (1028, 108, 'Bristol-Myers Squibb', 'contact@bms.com'),
    (1029, 109, 'Gilead Sciences', 'contact@gilead.com'),
    (1030, 104, 'Amgen', 'contact@amgen.com');
  
-- Inserting 35 entries into the VACCINE table
INSERT INTO VACCINE (V_Id, Name, Storage_Temperature, Manufacturer, Dosage, C_Id)
VALUES
    (100001, 'COVID-19 Vaccine', '-1°C', 'Pfizer', 2, 1011),
    (100002, 'Flu Vaccine', '0°C', 'Johnson & Johnson', 1, 1012),
    (100003, 'Hepatitis Vaccine', '1°C', 'Merck', 1, 1013),
    (100004, 'COVID-19 Vaccine', '2°C', 'Novartis', 2, 1004),
    (100005, 'Tetanus Vaccine', '3°C', 'Roche', 2, 1005),
    (100006, 'Chicken Pox Vaccine', '4°C', 'GlaxoSmithKline', 1, 1006),
    (100007, 'COVID-19 Vaccine', '5°C', 'AstraZeneca', 1, 1007),
    (100008, 'Hepatitis Vaccine', '-1°C', 'Sanofi', 2, 1018),
    (100009, 'Flu Vaccine', '0°C', 'Eli Lilly', 1, 1009),
    (100010, 'COVID-19 Vaccine', '1°C', 'Abbott Laboratories', 2, 1010),
    (100011, 'Chicken Pox Vaccine', '2°C', 'Bristol-Myers Squibb', 2, 1011),
    (100012, 'Flu Vaccine', '3°C', 'Gilead Sciences', 1, 1012),
    (100013, 'Tetanus Vaccine', '4°C', 'Amgen', 1, 1013),
    (100014, 'COVID-19 Vaccine', '5°C', 'Biogen', 2, 1014),
    (100015, 'Hepatitis Vaccine', '-1°C', 'Genentech', 2, 1015),
    (100016, 'Flu Vaccine', '0°C', 'Mylan', 1, 1016),
    (100017, 'COVID-19 Vaccine', '1°C', 'Teva Pharmaceuticals', 1, 1017),
    (100018, 'Tetanus Vaccine', '2°C', 'Pfizer', 2, 1008),
    (100019, 'Flu Vaccine', '3°C', 'Johnson & Johnson', 1, 1019),
    (100020, 'COVID-19 Vaccine', '4°C', 'Merck', 2, 1021),
    (100021, 'Chicken Pox Vaccine', '5°C', 'Novartis', 2, 1021),
    (100022, 'Hepatitis Vaccine', '-1°C', 'Roche', 1, 1022),
    (100023, 'Tetanus Vaccine', '0°C', 'GlaxoSmithKline', 1, 1023),
    (100024, 'Flu Vaccine', '1°C', 'AstraZeneca', 2, 1024),
    (100025, 'COVID-19 Vaccine', '2°C', 'Sanofi', 1, 1025),
    (100026, 'Hepatitis Vaccine', '3°C', 'Eli Lilly', 2, 1026),
    (100027, 'COVID-19 Vaccine', '4°C', 'Abbott Laboratories', 2, 1017),
    (100028, 'Tetanus Vaccine', '5°C', 'Bristol-Myers Squibb', 1, 1028),
    (100029, 'Flu Vaccine', '-1°C', 'Gilead Sciences', 1, 1029),
    (100030, 'Chicken Pox Vaccine', '0°C', 'Amgen', 2, 1030),
    (100031, 'COVID-19 Vaccine', '1°C', 'Biogen', 2, 1011),
    (100032, 'Tetanus Vaccine', '2°C', 'Genentech', 1, 1022),
    (100033, 'Flu Vaccine', '3°C', 'Mylan', 1, 1023),
    (100034, 'Chicken Pox Vaccine', '4°C', 'Teva Pharmaceuticals', 2, 1014),
    (100035, 'Hepatitis Vaccine', '5°C', 'Pfizer', 2, 1014);

  -- Inserting 35 entries into the INVENTORY table 
INSERT INTO INVENTORY (I_Id, V_Id, H_Id, Quantity, Expiration_Date)
VALUES
    ('INV001', 100001, 101, 3210, '2024-04-15'),
    ('INV002', 100002, 102, 4550, '2024-09-30'),
    ('INV003', 100003, 103, 2760, '2025-02-20'),
    ('INV004', 100004, 104, 4020, '2024-07-10'),
    ('INV005', 100005, 105, 3440, '2026-11-05'),
    ('INV006', 100006, 106, 4980, '2025-12-31'),
    ('INV007', 100007, 107, 2940, '2024-08-15'),
    ('INV008', 100008, 108, 4370, '2024-03-05'),
    ('INV009', 100009, 109, 3450, '2026-05-20'),
    ('INV010', 100010, 110, 4690, '2026-10-10'),
    ('INV011', 100011, 101, 2460, '2025-11-30'),
    ('INV012', 100012, 109, 3730, '2024-06-25'),
    ('INV013', 100013, 103, 2920, '2026-02-15'),
    ('INV014', 100014, 104, 4230, '2024-05-10'),
    ('INV015', 100015, 109, 3600, '2024-12-20'),
    ('INV016', 100016, 106, 4810, '2025-08-05'),
    ('INV017', 100017, 107, 2140, '2026-03-31'),
    ('INV018', 100018, 108, 4630, '2025-07-15'),
    ('INV019', 100019, 109, 2950, '2024-04-10'),
    ('INV020', 100020, 110, 3750, '2026-09-30'),
    ('INV021', 100021, 101, 4120, '2024-10-20'),
    ('INV022', 100022, 101, 4570, '2026-06-15'),
    ('INV023', 100023, 103, 2360, '2025-01-10'),
    ('INV024', 100024, 104, 4920, '2025-03-25'),
    ('INV025', 100025, 105, 4060, '2026-11-30'),
    ('INV026', 100026, 106, 3800, '2024-09-15'),
    ('INV027', 100027, 107, 4310, '2026-01-05'),
    ('INV028', 100028, 108, 4780, '2026-12-31'),
    ('INV029', 100029, 101, 3660, '2025-04-20'),
    ('INV030', 100030, 101, 4170, '2026-04-10'),
    ('INV031', 100031, 101, 3520, '2024-03-15'),
    ('INV032', 100032, 108, 4930, '2025-05-10'),
    ('INV033', 100033, 103, 2720, '2026-08-25'),
    ('INV034', 100034, 105, 4210, '2026-07-10'),
    ('INV035', 100035, 104, 4820, '2024-01-31');

    -- Inserting 35 entries into the RESEARCH_COMPANY table 
INSERT INTO RESEARCH_COMPANY (Rc_Id, C_Id, Name, Contact)
VALUES
    (1000000001, 1001, 'Pharma Research Co', 'pharmaresearchco@example.com'),
    (1000000002, 1022, 'BioTech Innovations', 'biotechinnovations@example.com'),
    (1000000003, 1023, 'MediLab Research', 'medilabresearch@example.com'),
    (1000000004, 1023, 'LifeScience Solutions', 'lifesciencesolutions@example.com'),
    (1000000005, 1005, 'GenoMed Research', 'genomedresearch@example.com'),
    (1000000006, 1027, 'HealthTech Labs', 'healthtechlabs@example.com'),
    (1000000007, 1027, 'PharmaQuest Research', 'pharmaquestresearch@example.com'),
    (1000000008, 1028, 'InnoPharma Sciences', 'innopharmasciences@example.com'),
    (1000000009, 1009, 'BioHealth Innovations', 'biohealthinnovations@example.com'),
    (1000000010, 1010, 'MediGen Research', 'medigenresearch@example.com'),
    (1000000011, 1001, 'BioPharma Innovators', 'biopharmainnovators@example.com'),
    (1000000012, 1002, 'LifeGen Solutions', 'lifegensolutions@example.com'),
    (1000000013, 1003, 'HealthLab Research', 'healthlabresearch@example.com'),
    (1000000014, 1004, 'BioQuest Innovations', 'bioquestinnovations@example.com'),
    (1000000015, 1015, 'GenoMed Labs', 'genomedlabs@example.com'),
    (1000000016, 1016, 'PharmaTech Innovations', 'pharmatechinnovations@example.com'),
    (1000000017, 1027, 'HealthPharma Research', 'healthpharmaresearch@example.com'),
    (1000000018, 1008, 'InnoLife Sciences', 'innolifesciences@example.com'),
    (1000000019, 1009, 'BioHealth Labs', 'biohealthlabs@example.com'),
    (1000000020, 1020, 'MediQuest Innovations', 'mediquestinnovations@example.com'),
    (1000000021, 1011, 'PharmaGen Research', 'pharmagenresearch@example.com'),
    (1000000022, 1022, 'BioMed Innovations', 'biomedinnovations@example.com'),
    (1000000023, 1003, 'LifeTech Research', 'lifetechresearch@example.com'),
    (1000000024, 1004, 'GenoHealth Solutions', 'genohealthsolutions@example.com'),
    (1000000025, 1025, 'HealthGen Innovations', 'healthgeninnovations@example.com'),
    (1000000026, 1016, 'MediPharma Labs', 'medipharma@example.com'),
    (1000000027, 1007, 'InnoQuest Research', 'innoquestresearch@example.com'),
    (1000000028, 1018, 'BioTech Sciences', 'biotechsciences@example.com'),
    (1000000029, 1009, 'PharmaLife Innovations', 'pharmalifeinnovations@example.com'),
    (1000000030, 1010, 'MediGen Solutions', 'medigensolutions@example.com'),
    (1000000031, 1001, 'GenoPharma Innovations', 'genopharmainnovations@example.com'),
    (1000000032, 1002, 'HealthTech Labs', 'healthtechlabs@example.com'),
    (1000000033, 1003, 'BioQuest Research', 'bioquestresearch@example.com'),
    (1000000034, 1024, 'InnoMed Innovations', 'innomedinnovations@example.com'),
    (1000000035, 1015, 'PharmaGen Labs', 'pharmagenlabs@example.com');
    
-- Inserting 10 sample entries into the PRIVATE_RESEARCH_LAB table
INSERT INTO PRIVATE_RESEARCH_LAB (Prl_Rc_Id, Name, Contact)
VALUES
    (1000000001, 'InnoLab Innovations Inc.', 'innolab@example.com'),
    (1000000002, 'BioTech Research Group', 'biotech@example.com'),
    (1000000003, 'MediGen Innovations Labs', 'medigen@example.com'),
    (1000000004, 'LifeQuest Sciences Inc.', 'lifequest@example.com'),
    (1000000005, 'PharmaGen Solutions Group', 'pharmagen@example.com'),
    (1000000006, 'BioLife Innovations Corp.', 'biolife@example.com'),
    (1000000007, 'HealthTech Labs Research', 'healthtechlabs@example.com'),
    (1000000008, 'MediQuest Innovations Group', 'mediquest@example.com'),
    (1000000009, 'GenoMed Research Labs', 'genomed@example.com'),
    (1000000010, 'InnoHealth Labs Solutions', 'innohealth@example.com');

-- Inserting 15 sample entries into the MEDICAL_UNIVERSITIES table
INSERT INTO MEDICAL_UNIVERSITIES (Mu_Rc_Id, Name, Contact)
VALUES
    (1000000015, 'MediUni College of Medicine', 'mediuni@example.com'),
    (1000000016, 'HealthSci University School of Medicine', 'healthsci@example.com'),
    (1000000017, 'LifeTech Medical School', 'lifetech@example.com'),
    (1000000018, 'PharmaMed College of Health Sciences', 'pharmamed@example.com'),
    (1000000019, 'BioMed University Medical College', 'biomed@example.com'),
    (1000000035, 'InnoHealth Medical School', 'innohealth@example.com'),
    (1000000021, 'GenoMed University School of Medicine', 'genomed@example.com'),
    (1000000022, 'MediQuest Medical College', 'mediquest@example.com'),
    (1000000023, 'BioTech Health Sciences University', 'biotech@example.com'),
    (1000000024, 'LifeQuest Medical School', 'lifequest@example.com'),
    (1000000025, 'PharmaGen Medical University', 'pharmagen@example.com'),
    (1000000026, 'BioLife School of Medicine', 'biolife@example.com'),
    (1000000027, 'HealthTech Medical College', 'healthtech@example.com'),
    (1000000028, 'MediGen Medical University', 'medigen@example.com'),
    (1000000029, 'InnoLab College of Medicine', 'innolab@example.com');

-- Inserting 5 sample entries into the ORGANISATIONS_CAMPS table
INSERT INTO ORGANISATIONS_CAMPS (Org_Id, Name, LOC)
VALUES
    (15, 'HealthCare Foundation', 'New York, NY'),
    (24, 'MediServe Alliance', 'Los Angeles, CA'),
    (23, 'Wellness Network', 'Chicago, IL'),
    (14, 'LifeHealth Institute', 'Houston, TX'),
    (59, 'MediCare Group', 'Miami, FL');
    
-- Inserting 20 sample entries into the INSURANCE_COMPANY table
INSERT INTO INSURANCE_COMPANY (Insurance_Id, Policy_No, Provider)
VALUES
    (10001, 'A12345', 'HealthGuard Insurance'),
    (10002, 'B54321', 'MediCare Insurance'),
    (10003, 'C98765', 'LifeCare Assurance'),
    (10004, 'D56789', 'Wellness Insurance'),
    (10005, 'E13579', 'Guardian Health Plan'),
    (10006, 'F24680', 'MediShield Assurance'),
    (10007, 'G87654', 'LifeSafe Insurance'),
    (10008, 'H54321', 'HealthCare Providers'),
    (10009, 'I98765', 'MediSure Assurance'),
    (10010, 'J12345', 'WellGuard Insurance'),
    (10011, 'K34567', 'SecureLife Insurance'),
    (10012, 'L43210', 'MediPro Health Plan'),
    (10013, 'M56789', 'LifeProtect Assurance'),
    (10014, 'N87654', 'HealthNet Insurance'),
    (10015, 'O13579', 'MediCoverage Assurance'),
    (10016, 'P54321', 'SafeHealth Providers'),
    (10017, 'Q98765', 'LifeAssure Insurance'),
    (10018, 'R87654', 'WellnessCare Assurance'),
    (10019, 'S43210', 'MediGuard Insurance'),
    (10020, 'T34567', 'HealthSure Providers');
    
 -- Inserting 35 manual entries into the PERSON table
INSERT INTO PERSON (P_Id, Insurance_Id, Org_Id, H_Id, Adrs, Name, Age, Gender, Phone, Vaccine_status)
VALUES
    (12345678, 10001, 15, null, '123 Main St, New York, NY', 'John Doe', 30, 'Male', '123-456-7890', 'Fully Vaccinated'),
    (23456789, 10002, 24, null, '456 Elm St, Los Angeles, CA', 'Jane Smith', 25, 'Female', '987-654-3210', 'Partially Vaccinated'),
    (34567890, 10003, null, 107, '789 Oak St, Chicago, IL', 'Robert Johnson', 40, 'Male', '555-123-4567', 'Fully Vaccinated'),
    (45678901, 10004, 14, null, '567 Pine St, Houston, TX', 'Mary Brown', 35, 'Female', '888-999-7777', 'Fully Vaccinated'),
    (56789012, 10005, null, 105, '678 Cedar St, Miami, FL', 'Michael White', 28, 'Male', '777-666-5555', 'Partially Vaccinated'),
    (67890123, 10006, null, 101, '789 Birch St, Boston, MA', 'Sarah Johnson', 22, 'Female', '444-555-6666', 'Fully Vaccinated'),
    (78901234, 10007, null, 102, '890 Maple St, San Francisco, CA', 'Chris Lee', 32, 'Male', '111-222-3333', 'Fully Vaccinated'),
    (89012345, 10008, null, 103, '901 Oak St, Philadelphia, PA', 'Anna Smith', 27, 'Female', '999-888-7777', 'Partially Vaccinated'),
    (90123456, 10009, null, 104, '112 Elm St, Seattle, WA', 'Daniel Davis', 44, 'Male', '555-444-3333', 'Fully Vaccinated'),
    (12345670, 10010, null, 105, '567 Pine St, Atlanta, GA', 'Emily Miller', 31, 'Female', '333-444-5555', 'Fully Vaccinated'),
    (23456771, 10011, null, 104, '678 Cedar St, Chicago, IL', 'John Anderson', 29, 'Male', '222-111-0000', 'Partially Vaccinated'),
    (34567872, 10012, null, 106, '789 Birch St, Los Angeles, CA', 'Linda Wilson', 36, 'Female', '999-111-2222', 'Fully Vaccinated'),
    (45678973, 10013, null, 107, '890 Maple St, New York, NY', 'Robert Davis', 50, 'Male', '111-222-3333', 'Fully Vaccinated'),
    (56789074, 10014, 24, null, '901 Oak St, Houston, TX', 'Susan Moore', 42, 'Female', '444-555-6666', 'Partially Vaccinated'),
    (67890175, 10015, null, null, '112 Elm St, Miami, FL', 'William Taylor', 34, 'Male', '777-888-9999', 'Not Vaccinated'),
    (78901276, 10016, 59, null, '123 Main St, Boston, MA', 'Laura Clark', 26, 'Female', '222-111-0000', 'Fully Vaccinated'),
    (89012377, 10017, null, 103, '456 Elm St, San Francisco, CA', 'Mark Jackson', 38, 'Male', '555-444-3333', 'Partially Vaccinated'),
    (90123478, 10018, null, null, '789 Oak St, Philadelphia, PA', 'Patricia Lewis', 33, 'Female', '777-666-5555', 'Not Vaccinated'),
    (12345679, 10019, null, 104, '123 Main St, Seattle, WA', 'James Young', 41, 'Male', '888-999-7777', 'Fully Vaccinated'),
    (23453580, 10020, null, 105, '456 Elm St, Atlanta, GA', 'Karen Harris', 45, 'Female', '123-456-7890', 'Partially Vaccinated'),
    (34567881, 10001, null, 101, '789 Oak St, Chicago, IL', 'David Martin', 37, 'Male', '987-654-3210', 'Fully Vaccinated'),
    (45678982, 10012, null, 102, '567 Pine St, Los Angeles, CA', 'Jennifer White', 24, 'Female', '555-123-4567', 'Fully Vaccinated'),
    (56789083, 10003, null, 103, '678 Cedar St, New York, NY', 'Michael Johnson', 29, 'Male', '777-888-9999', 'Partially Vaccinated'),
    (67890184, 10014, null, 104, '123 Main St, Houston, TX', 'Cynthia Wilson', 31, 'Female', '123-456-7890', 'Fully Vaccinated'),
    (78901285, 10005, null, 105, '456 Elm St, Miami, FL', 'Brian Davis', 36, 'Male', '987-654-3210', 'Fully Vaccinated'),
    (89012386, 10016, null, 101, '234 Oak St, Los Angeles, CA', 'Melissa Martinez', 29, 'Female', '555-123-4567', 'Fully Vaccinated'),
    (90123487, 10007, null, 102, '345 Elm St, Chicago, IL', 'Kevin Harris', 36, 'Male', '777-666-5555', 'Partially Vaccinated'),
    (12345688, 10018, null, 103, '456 Pine St, New York, NY', 'Amanda Lewis', 33, 'Female', '123-456-7890', 'Fully Vaccinated'),
    (23453789, 10001, null, 104, '567 Cedar St, Houston, TX', 'Robert Moore', 41, 'Male', '987-654-3210', 'Fully Vaccinated'),
    (34667890, 10010, null, 105, '678 Birch St, Miami, FL', 'Jennifer Taylor', 27, 'Female', '555-444-3333', 'Partially Vaccinated'),
    (46678991, 10011, null, 101, '789 Maple St, Boston, MA', 'Daniel Johnson', 38, 'Male', '777-888-9999', 'Fully Vaccinated'),
    (56669092, 10001, null, 102, '890 Oak St, San Francisco, CA', 'Sarah Anderson', 35, 'Female', '123-456-7890', 'Fully Vaccinated'),
    (67860193, 10020, null, 103, '901 Elm St, Philadelphia, PA', 'David Clark', 32, 'Male', '444-555-6666', 'Partially Vaccinated'),
    (76701294, 10014, null, 104, '112 Pine St, Seattle, WA', 'Emily Wilson', 40, 'Female', '111-222-3333', 'Fully Vaccinated'),
    (89076395, 10001, null, 105, '234 Cedar St, Atlanta, GA', 'Michael Smith', 42, 'Male', '555-123-4567', 'Fully Vaccinated'),
    (90123496, 10001, null, 101, '123 Oak St, Los Angeles, CA', 'Laura Hernandez', 28, 'Female', '987-654-3210', 'Fully Vaccinated'),
    (17745697, 10001, null, 102, '234 Elm St, Chicago, IL', 'Mark Davis', 35, 'Male', '444-555-6666', 'Partially Vaccinated'),
    (23616798, 10001, 59, null, '345 Pine St, New York, NY', 'Catherine Anderson', 30, 'Female', '555-444-3333', 'Fully Vaccinated'),
    (34517899, 10020, null, 104, '456 Cedar St, Houston, TX', 'Daniel Miller', 33, 'Male', '123-456-7890', 'Fully Vaccinated'),
    (45678900, 10010, null, 105, '567 Birch St, Miami, FL', 'Jennifer Wilson', 29, 'Female', '777-888-9999', 'Partially Vaccinated'),
    (56789001, 10019, null, null, '678 Maple St, Boston, MA', 'Michael Clark', 38, 'Male', '987-654-3210', 'Not Vaccinated'),
    (67890102, 10001, null, 102, '789 Oak St, San Francisco, CA', 'Jessica Taylor', 31, 'Female', '111-222-3333', 'Fully Vaccinated'),
    (78901203, 10013, null, 103, '890 Elm St, Philadelphia, PA', 'Christopher Brown', 37, 'Male', '123-456-7890', 'Partially Vaccinated'),
    (89012304, 10012, null, 104, '901 Pine St, Seattle, WA', 'Emily Johnson', 45, 'Female', '555-123-4567', 'Fully Vaccinated'),
    (90123405, 10019, 14, null, '112 Cedar St, Atlanta, GA', 'William Smith', 42, 'Male', '777-666-5555', 'Fully Vaccinated');
 
 -- Inserting 43 entries into the VACCINATED_BY table
INSERT INTO VACCINATED_BY (P_Id, V_Id) VALUES
    (12345678, 100002),
    (23456789, 100022),
    (34567890, 100003),
    (45678901, 100004),
    (56789012, 100015),
    (67890123, 100026),
    (78901234, 100026),
    (89012345, 100008),
    (90123456, 100009),
    (12345670, 100010),
    (23456771, 100011),
    (34567872, 100012),
    (45678973, 100013),
    (56789074, 100014),
    (67890175, 100015),
    (78901276, 100016),
    (89012377, 100017),
    (90123478, 100018),
    (12345679, 100019),
    (23453580, 100020),
    (34567881, 100021),
    (45678982, 100022),
    (56789083, 100023),
    (67890184, 100024),
    (78901285, 100025),
    (89012386, 100026),
    (90123487, 100027),
    (12345688, 100018),
    (23453789, 100019),
    (34667890, 100002),
    (46678991, 100002),
    (56669092, 100002),
    (67860193, 100003),
    (76701294, 100014),
    (89076395, 100015),
    (90123496, 100006),
    (17745697, 100017),
    (23616798, 100018),
    (34517899, 100019),
    (45678900, 100010),
    (67890102, 100022),
    (78901203, 100013),
    (89012304, 100014);

-- Inserting 43 entries into the PRESCRIPTION_BY table
INSERT INTO PRESCRIPTION_BY (P_Id, D_Id) 
VALUES
    (12345678, 10),
    (23456789, 01),
    (34567890, 02),
    (45678901, 04),
    (56789012, 01),
    (67890123, 04),
    (78901234, 02),
    (89012345, 08),
    (90123456, 09),
    (12345670, 05),
    (23456771, 01),
    (34567872, 02),
    (45678973, 03),
    (56789074, 03),
    (67890175, 01),
    (78901276, 04),
    (89012377, 04),
    (90123478, 04),
    (12345679, 02),
    (23453580, 04),
    (34567881, 06),
    (45678982, 03),
    (56789083, 01),
    (67890184, 03),
    (78901285, 09),
    (89012386, 05),
    (90123487, 04),
    (12345688, 04),
    (23453789, 09),
    (34667890, 03),
    (46678991, 02),
    (56669092, 06),
    (67860193, 09),
    (76701294, 05),
    (89076395, 02),
    (90123496, 09),
    (17745697, 02),
    (23616798, 10),
    (34517899, 09),
    (45678900, 01),
    (67890102, 04),
    (78901203, 04),
    (89012304, 04);





















-- Query 1 (Retrives Names of people who took Covid-19 Vaccine.)
Select p.name as PersonName, v.name as VaccineName
from person p , vaccinated_by vb , vaccine v
where p.P_Id = vb.P_Id and vb.V_Id = v.V_Id and v.name = 'COVID-19 Vaccine';

-- Query 2 (Retrieve Names of Doctors with their Specialisation who works in New York.)
select name , Specialisation
from doctor 
where H_id in ( select H_id from hospital where Location like '%New York%');

-- Query 3 (Find People that were vaaccinated by Organiszation Camps rather than hospitals with the organisation names.)
select p.name,o.Name
from person p join organisations_camps o
on p.Org_Id = o.Org_Id;

-- Query 4 (Get the list of people who are not Vaccinated and are above age 30.)
select *
from Person 
where Vaccine_status = 'Not Vaccinated' and age > 30;

-- Query 5 (Get details of Hospital that have more than three inventories.)
select *
from hospital
where H_Id in ( select H_Id
				from inventory 
                group by H_id
                having count(*) > 3);
                
-- Query 6 (Vaccines which should be store under 1 degree celsius.)
select *
from vaccine
where Storage_Temperature < '0°C';

-- Query 7 (Insurnace providers who have the maximum active customers.)
select *
from insurance_company 
where Insurance_Id = ( select Insurance_Id
						from person
                        group by Insurance_Id
                        order by count(*) DESC
                        limit 1);

-- Query 8  (Retrieve names of people who took vaccines from organisation camps.)
SELECT p.P_Id , p.Name , o.Name
FROM PERSON p, ORGANISATIONS_CAMPS o
where p.Org_Id = o.Org_Id and p.Org_Id IN ('14','15','23','24','59');

-- Query 9 (Get the information about doctors and the hospitals they work in.)
SELECT D.Name AS Doctor_Name, D.Specialisation, D.Contact , H.Name AS Hospital_Name
FROM DOCTOR D, HOSPITAL H
WHERE D.H_Id = H.H_Id;

-- Query 10 (Give the names of people and the doctor they were treated by.)
SELECT P.Name AS Person_Name, D.Name AS Doctor_Name
FROM PERSON P, DOCTOR D, PRESCRIPTION_BY PB 
WHERE P.P_Id = PB.P_Id
and PB.D_Id = D.D_Id;

-- Query 11 (Retrive Research companies that have tie-up with Pzifier company to conduct reserach on vaccines.)
select r.rc_id , r.name as RESEARCHCOMPANY , p.Name as PHARMACEUTICALCOMPANY
from RESEARCH_COMPANY r , PHARMACEUTICAL_COMPANY P
where r.c_Id = p.c_id and p.name = 'Pfizer';

-- Query 12 (Retrive RESEARCH COMPANIES that are neither private labs nor medical universities.)
SELECT r.rc_id , r.name
from RESEARCH_COMPANY r
where r.rc_id not in ( SELECT p.prl_rc_id
                      from PRIVATE_RESEARCH_LAB p , MEDICAL_UNIVERSITIES m ) and r.rc_id not in  (SELECT  m.mu_rc_id
                      from PRIVATE_RESEARCH_LAB p , MEDICAL_UNIVERSITIES m );

-- Query 13 (Find the location in US having maximum number of vaccinated people with proper prescription.)
select h.Location, COUNT(*) VaccinatedPatients
from person p join HOSPITAL h on p.H_Id = h.H_Id
group by h.location
order by count(*) DESC
limit 1;

-- Query 14 ( Find Doctors who have served in their corresponding hospital for more than 5 years)
Select d.name
from DOCTOR d
where d.d_id in (select d_id
from HEALTHCARE_SERVICE
where service_duration > '5 years');

-- Query 15 (Find the hospital running low on stock for Hepatitis vacccines that are manufactured by Merck)( NOTE - Vaccine are considered low in stock if the hospital has less than 3000 vaccines)
select name
from HOSPITAL
WHERE h_id in ( SELECT h_id
               from INVENTORY
               where quantity < 3000 AND v_id in ( SELECT v_id
                                from VACCINE
                                where name='Hepatitis Vaccine'
                                                    and manufacturer = 'Merck' )) ;