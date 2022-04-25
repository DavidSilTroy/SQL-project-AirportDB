DROP TABLE IF EXISTS airport.Ticket;
DROP TABLE IF EXISTS airport.Flight;
DROP TABLE IF EXISTS airport.Airplane;
DROP TABLE IF EXISTS airport.Passenger;
DROP TABLE IF EXISTS airport.FlightRegister;
DROP TABLE IF EXISTS airport.Airline;
DROP TABLE IF EXISTS airport.City;

DROP SCHEMA IF EXISTS airport;

CREATE SCHEMA airport;

CREATE TABLE airport.City
    (
    cityID  INT NOT NULL PRIMARY KEY,
    name            varchar(100) NOT NULL,
    code            varchar(50) NOT NULL
    );

CREATE TABLE airport.Airline
    (
    airlineID       INT NOT NULL PRIMARY KEY,
    name            varchar(100) NOT NULL,
    imgSrc          varchar(500) NOT NULL
    );

CREATE TABLE airport.FlightRegister
    (
    registerID      INT NOT NULL PRIMARY KEY,
    status          varchar(200),
    created         Date NOT NULL,
    modified        Date NOT NULL,
    national        TINYINT NOT NULL,
    landing         TINYINT NOT NULL,
    showFlight      TINYINT NOT NULL
    );


CREATE TABLE airport.Passenger
    (
    passengerID     INT NOT NULL PRIMARY KEY,
    name            varchar(50) NOT NULL,
    lastName        varchar(100) NOT NULL,
    email           varchar(255) NOT NULL,
    phone           varchar(20)
    );



CREATE TABLE airport.Airplane
    (
    airplaneID  INT NOT NULL PRIMARY KEY,
    code            varchar(50) NOT NULL,
    airlineID       INT NOT NULL,
    FOREIGN KEY  (airlineID) REFERENCES airport.Airline (airlineID)
    );

CREATE TABLE airport.Flight
    (
    flightID        INT NOT NULL PRIMARY KEY,
    flightDate        	Datetime NOT NULL,
    airplaneID      INT NOT NULL,
    cityID  INT     NOT NULL,
    registerID      INT NOT NULL,
    FOREIGN KEY  (airplaneID) REFERENCES airport.Airplane (airplaneID),
    FOREIGN KEY  (cityID) REFERENCES airport.City (cityID),
    FOREIGN KEY  (registerID) REFERENCES airport.FlightRegister (registerID)
    );

CREATE TABLE airport.Ticket
    (
    ticketID        INT NOT NULL PRIMARY KEY,
    price           varchar(100) NOT NULL,
    flightID       INT NOT NULL,
    passengerID       INT NOT NULL,
    FOREIGN KEY  (flightID) REFERENCES airport.Flight (flightID),
    FOREIGN KEY  (passengerID) REFERENCES airport.Passenger (passengerID)
    );




INSERT INTO airport.City VALUES (1,'Acapulco', 'ACA');
INSERT INTO airport.City VALUES (2,'Almeria', 'LEI');
INSERT INTO airport.City VALUES (3,'Amsterdam', 'AMS');
INSERT INTO airport.City VALUES (4,'Athens', 'ATH');
INSERT INTO airport.City VALUES (5,'Bangalore', 'BLR');
INSERT INTO airport.City VALUES (6,'Beijing', 'BJS');
INSERT INTO airport.City VALUES (7,'Bogota', 'BOG');
INSERT INTO airport.City VALUES (8,'Brest', 'BES');
INSERT INTO airport.City VALUES (9,'Brussels', 'BRU');
INSERT INTO airport.City VALUES (10,'Davao', 'DVO');
INSERT INTO airport.City VALUES (11,'Florence', 'FLR');
INSERT INTO airport.City VALUES (12,'Hamburg', 'HAM');
INSERT INTO airport.City VALUES (13,'Guayaquil', 'GYE');
INSERT INTO airport.City VALUES (14,'Lagos', 'LOS');
INSERT INTO airport.City VALUES (15,'Mariupol', 'MPW');

INSERT INTO airport.Airline VALUES (1,'Avianca', '/img/AviancaLogo.jpg');
INSERT INTO airport.Airline VALUES (2,'American Airlines', '/img/AmericanAirlinesLogo.jpg');
INSERT INTO airport.Airline VALUES (3,'LAN Airlines', '/img/LANAirlinesLogo.jpg');
INSERT INTO airport.Airline VALUES (4,'Qantas', '/img/QantasLogo.jpg');
INSERT INTO airport.Airline VALUES (5,'Swiss', '/img/SwissLogo.jpg');
INSERT INTO airport.Airline VALUES (6,'WestJet', '/img/WestJetLogo.jpg');
INSERT INTO airport.Airline VALUES (7,'Korean Air', '/img/KoreanAirLogo.jpg');
INSERT INTO airport.Airline VALUES (8,'easyJet', '/img/easyJetLogo.jpg');
INSERT INTO airport.Airline VALUES (9,'LATAM', '/img/LATAMLogo.jpg');
INSERT INTO airport.Airline VALUES (10,'KML', '/img/KMLLogo.jpg');
INSERT INTO airport.Airline VALUES (11,'Iberia', '/img/IberiaLogo.jpg');
INSERT INTO airport.Airline VALUES (12,'Emirates', '/img/EmiratesLogo.jpg');
INSERT INTO airport.Airline VALUES (13,'EVA Air', '/img/EVAAirLogo.jpg');
INSERT INTO airport.Airline VALUES (14,'Aeroflot', '/img/AeroflotLogo.jpg');
INSERT INTO airport.Airline VALUES (15,'Citilink', '/img/CitilinkLogo.jpg');

INSERT INTO airport.FlightRegister VALUES (1,null, '2022-03-21','2022-03-22',0,0,1);
INSERT INTO airport.FlightRegister VALUES (2,'delay', '2022-03-12','2022-03-12',1,0,1);
INSERT INTO airport.FlightRegister VALUES (3,'landing', '2022-03-12','2022-03-13',0,1,0);
INSERT INTO airport.FlightRegister VALUES (4,'arriving', '2022-03-20','2022-03-20',1,0,1);
INSERT INTO airport.FlightRegister VALUES (5,'delay', '2022-03-05','2022-03-06',1,0,1);
INSERT INTO airport.FlightRegister VALUES (6,null, '2022-03-09','2022-03-10',0,1,1);
INSERT INTO airport.FlightRegister VALUES (7,null, '2022-03-15','2022-03-16',1,0,0);
INSERT INTO airport.FlightRegister VALUES (8,null, '2022-03-11','2022-03-12',1,1,1);
INSERT INTO airport.FlightRegister VALUES (9,'landing', '2022-03-17','2022-03-17',0,1,1);
INSERT INTO airport.FlightRegister VALUES (10,null, '2022-03-23','2022-03-24',1,1,1);
INSERT INTO airport.FlightRegister VALUES (11,null, '2022-03-02','2022-03-03',0,1,0);
INSERT INTO airport.FlightRegister VALUES (12,'arriving', '2022-03-26','2022-03-27',1,0,1);
INSERT INTO airport.FlightRegister VALUES (13,null, '2022-03-19','2022-03-19',0,0,1);
INSERT INTO airport.FlightRegister VALUES (14,'landing', '2022-03-22','2022-03-22',0,1,1);
INSERT INTO airport.FlightRegister VALUES (15,null, '2022-03-10','2022-03-10',1,1,0);

INSERT INTO airport.Passenger VALUES (1,'David', 'Silva','davidsiltroy2008@hotmail.com','+32499849256');
INSERT INTO airport.Passenger VALUES (2,'Luis', 'Wilson','Luisitoxd@gmail.com','');
INSERT INTO airport.Passenger VALUES (3,'Kevin', 'Jenkins','kJenkthebest@hotmail.com','+32499849256');
INSERT INTO airport.Passenger VALUES (4,'Richard', 'McDaniel','rich4rdmcdan@hotmail.com','');
INSERT INTO airport.Passenger VALUES (5,'Charles', 'Garcia','garcharles@hotmail.com','');
INSERT INTO airport.Passenger VALUES (6,'Mark', 'Foster','fost3rmark@hotmail.com','+32499849256');
INSERT INTO airport.Passenger VALUES (7,'Terry', 'Brannon','bran1432@hotmail.com','');
INSERT INTO airport.Passenger VALUES (8,'Denise', 'Ringer','rin12den22@hotmail.com','+32499849256');
INSERT INTO airport.Passenger VALUES (9,'Peter', 'Parker','iamnotspiderman@hotmail.com','');
INSERT INTO airport.Passenger VALUES (10,'Sarah', 'Clark','sarclar1323@hotmail.com','');
INSERT INTO airport.Passenger VALUES (11,'Susan', 'Colson','sc12dverdac@hotmail.com','+32499849256');
INSERT INTO airport.Passenger VALUES (12,'Millard', 'Johnson','millardj512@hotmail.com','');
INSERT INTO airport.Passenger VALUES (13,'Pat', 'Peak','pp4everandever@hotmail.com','');
INSERT INTO airport.Passenger VALUES (14,'Steven', 'Smith','stev3nsm1th@hotmail.com','+32499849256');
INSERT INTO airport.Passenger VALUES (15,'Janette', 'Robbs','robbs2809jan32t3@hotmail.com','');

INSERT INTO airport.Airplane VALUES (1,'A321', 2);
INSERT INTO airport.Airplane VALUES (2,'AT72', 1);
INSERT INTO airport.Airplane VALUES (3,'B73K', 4);
INSERT INTO airport.Airplane VALUES (4,'C25A', 3);
INSERT INTO airport.Airplane VALUES (5,'DC8', 9);
INSERT INTO airport.Airplane VALUES (6,'E120', 7);
INSERT INTO airport.Airplane VALUES (7,'G159', 5);
INSERT INTO airport.Airplane VALUES (8,'IL76', 10);
INSERT INTO airport.Airplane VALUES (9,'P180', 6);
INSERT INTO airport.Airplane VALUES (10,'SF34', 13);
INSERT INTO airport.Airplane VALUES (11,'SU95', 8);
INSERT INTO airport.Airplane VALUES (12,'YK40', 15);
INSERT INTO airport.Airplane VALUES (13,'YS11', 11);
INSERT INTO airport.Airplane VALUES (14,'RJ85', 14);
INSERT INTO airport.Airplane VALUES (15,'N262', 12);

INSERT INTO airport.Flight VALUES (1,'2022-03-21 11:12:13',1,1,1);
INSERT INTO airport.Flight VALUES (2,'2022-03-12 11:12:13',2,2,2);
INSERT INTO airport.Flight VALUES (3,'2022-03-12 11:12:13',3,3,3);
INSERT INTO airport.Flight VALUES (4,'2022-03-20 11:12:13',4,4,4);
INSERT INTO airport.Flight VALUES (5,'2022-03-05 11:12:13',5,5,5);
INSERT INTO airport.Flight VALUES (6,'2022-03-09 11:12:13',6,6,6);
INSERT INTO airport.Flight VALUES (7,'2022-03-15 11:12:13',7,7,7);
INSERT INTO airport.Flight VALUES (8,'2022-03-11 11:12:13',8,8,8);
INSERT INTO airport.Flight VALUES (9,'2022-03-17 11:12:13',9,9,9);
INSERT INTO airport.Flight VALUES (10,'2022-03-23 11:12:13',10,10,10);
INSERT INTO airport.Flight VALUES (11,'2022-03-02 11:12:13',11,11,11);
INSERT INTO airport.Flight VALUES (12,'2022-03-26 11:12:13',12,12,12);
INSERT INTO airport.Flight VALUES (13,'2022-03-19 11:12:13',13,13,13);
INSERT INTO airport.Flight VALUES (14,'2022-03-22 11:12:13',14,14,14);
INSERT INTO airport.Flight VALUES (15,'2022-03-10 11:12:13',15,15,15);

INSERT INTO airport.Ticket VALUES (1,'150.00',1,1);
INSERT INTO airport.Ticket VALUES (2,'120.00',2,2);
INSERT INTO airport.Ticket VALUES (3,'160.00',3,3);
INSERT INTO airport.Ticket VALUES (4,'1140.00',4,4);
INSERT INTO airport.Ticket VALUES (5,'124.00',5,5);
INSERT INTO airport.Ticket VALUES (6,'159.00',6,6);
INSERT INTO airport.Ticket VALUES (7,'280.00',7,7);
INSERT INTO airport.Ticket VALUES (8,'950.00',8,8);
INSERT INTO airport.Ticket VALUES (9,'620.00',9,9);
INSERT INTO airport.Ticket VALUES (10,'1200.00',10,10);
INSERT INTO airport.Ticket VALUES (11,'3200.00',11,11);
INSERT INTO airport.Ticket VALUES (12,'1480.00',12,12);
INSERT INTO airport.Ticket VALUES (13,'600.00',13,13);
INSERT INTO airport.Ticket VALUES (14,'999.00',14,14);
INSERT INTO airport.Ticket VALUES (15,'100.00',15,15);



SELECT * FROM airport.city;
SELECT * FROM airport.airline;
SELECT * FROM airport.FlightRegister;
SELECT * FROM airport.Passenger;
SELECT * FROM airport.Airplane;
SELECT * FROM airport.Flight;
SELECT * FROM airport.Ticket;


