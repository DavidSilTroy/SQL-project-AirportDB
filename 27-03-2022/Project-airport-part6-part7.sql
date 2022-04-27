
#Assignment 6: SQL queries Basic subqueries
select registerID, status from airport.FlightRegister where day(created) in (select day(created) as 'day created' from airport.FlightRegister where status = 'landing');
select ticketID, price from airport.Ticket where price < (SELECT price FROM airport.Ticket where ticketID = 11);
select flightID, flightDate from airport.flight where day(flightDate) != (select day(flightDate) as 'day of flight' from airport.flight where flightID = 2);
select flightDate as 'airplane P180 for date' from airport.flight where airplaneID = (select airplaneID from airport.airplane where code = "P180");
select flightID, flightDate from airport.Flight where cityID not in (select cityID from airport.city where name like "A%");
select 
	(select concat(name,' ', lastName) from airport.Passenger where passengerID = 1) as 'first',
    (select concat(name,' ', lastName) from airport.Passenger where passengerID = 2) as 'second',
    (select concat(name,' ', lastName) from airport.Passenger where passengerID = 3) as 'third';
    
#Assignment 7: SQL queries Set functions + Correlated subqueries
##Queries using set functions
select count(*) as 'airplanes for the 12th' from airport.flight where day(flightDate) = 12;
select count(distinct substr(name,1,1)) as 'different letters in the begining of the names' from airport.Passenger;
select avg(price) as 'Average price from tikets' from airport.ticket;
select max(day(flightDate)) as 'the latest day',min(day(flightDate)) as 'the earliest day' from airport.flight;
##Correlated subqueries in WHERE/SELECT
select price as 'David has to pay' from airport.ticket WHERE passengerID = (SELECT passengerID from airport.passenger where name = 'David');
select flightID as 'id', flightDate as 'Date of flight' from airport.flight where flightID = (select flightID from airport.ticket where price = (select min(price) from airport.ticket));
select concat('David is traveling to ', name) as 'User info' from airport.city where cityID = (select cityID from airport.flight where flightID =(select flightID from airport.ticket WHERE passengerID = (SELECT passengerID from airport.passenger where name = 'David')));
select name as 'flights landing coming from' from airport.city where cityID in (select cityID from airport.flight where registerID in (select registerID from airport.flightRegister where landing = 1 and status is not null));

