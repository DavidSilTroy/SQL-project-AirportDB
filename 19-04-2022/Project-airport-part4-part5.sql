
#Assignment 4: SQL queries WHERE component + scalair functions
select ifnull(status,'no status') as status from airport.flightregister;
select airplaneID as 'the id is' from airport.airplane where code = "P180";
select cityID as id, name as 'city name', code from airport.city where name like "A%";
select ticketID as 'id', price as 'ticket price' from airport.ticket where price < 150;
select distinct status from airport.flightregister where status not in ("nothing","delay");
select passengerID as 'passenger ID', concat(name, ' ', lastName) as 'name' from airport.passenger where name like "D%" and passengerID > 5;
select registerID as 'register ID', status, date_format(created,'%d %M %Y')  as 'created' from airport.flightregister where status in ("landing","delay");
select concat('The flight id: ', flightID,' is for the ', flightDate) as 'Current Flights' from airport.flight where flightDate between '2022-02-01 00:00:00' and '2022-03-15 12:00:00' order by flightDate;

#Assignment 5: SQL queries JOINS
select af.flightID as 'flight ID', concat('Flight for ', af.flightDate,' has status: ', ifnull(afr.status, 'Nothing')) as information from airport.flight af join airport.flightregister afr on af.registerID = afr.registerID;
select af.flightID as 'flight ID', concat('Flight for ', af.flightDate ,' to the city: ', ac.name) as information from airport.flight af join airport.city ac on af.cityID = ac.cityID join airport.flightregister afr on af.registerID = afr.registerID where afr.landing = 0;
select af.flightID as 'flight ID', concat('Flight for ', af.flightDate ,' from the city: ', ac.name) as information from airport.flight af join airport.city ac on af.cityID = ac.cityID join airport.flightregister afr on af.registerID = afr.registerID where afr.landing = 1;
select concat(ap.name, ' ', ap.lastName, ' in the flight at ', af.flightDate, 'with a ticket of $', ati.price) as 'Passengers Information' from airport.ticket ati join airport.passenger ap on ati.passengerID = ap.passengerID join airport.flight af on af.flightID = ati.flightID;
select concat(ap.name , ' ', ap.lastName) as Name, ac.name as 'city to go', af.flightDate as 'flight date' from airport.flight af join airport.city ac on af.cityID = ac.cityID join airport.ticket ati on af.flightID = ati.flightID join airport.passenger ap on ati.passengerID = ap.passengerID join airport.flightregister afr on af.registerID = afr.registerID where afr.landing=0;
select concat(ap.name , ' ', ap.lastName) as Name, ac.name as 'city from', af.flightDate as 'flight date' from airport.flight af join airport.city ac on af.cityID = ac.cityID join airport.ticket ati on af.flightID = ati.flightID join airport.passenger ap on ati.passengerID = ap.passengerID join airport.flightregister afr on af.registerID = afr.registerID where afr.landing=1;
select concat('airplane ', aa.code,' flying to ', ac.name) as 'Airplane information' from airport.flight af join airport.flightregister afr on af.registerID = afr.registerID join airport.city ac on af.cityID = ac.cityID join airport.airplane aa on af.airplaneID = aa.airlineID where afr.showFlight = 1 and afr.landing=0; 
select concat('airplane ', aa.code,' coming from ', ac.name) as 'Airplane information' from airport.flight af join airport.flightregister afr on af.registerID = afr.registerID join airport.city ac on af.cityID = ac.cityID join airport.airplane aa on af.airplaneID = aa.airlineID where afr.showFlight = 1 and afr.landing=1; 







