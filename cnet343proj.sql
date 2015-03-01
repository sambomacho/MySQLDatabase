//Create Schema
CREATE SCHEMA `cnet343proj` ; 
OR
CREATE DATABASE cnet343proj;
Create Users Table
CREATE TABLE users (
User_id int(11) NOT NULL AUTO_INCREMENT,
fname VARCHAR(60) NOT NULL,
sname VARCHAR(60) NOT NULL,
dob date NOT NULL,
mobile INT(11) NOT NULL,
email VARCHAR(160) NOT NULL, 
PRIMARY KEY (user_id)
);

//Create Bookings Table
CREATE TABLE bookings ( 
Booking_id INT(11) NOT NULL AUTO_INCREMENT,
 User_id INT (11) NOT NULL,
 Screening_id INT (11) NOT NULL, 
PRIMARY KEY (booking_id)
);

//Create Screenings Table
CREATE TABLE screenings(
Screening_id INT(11) NOT NULL AUTO_INCREMENT,
Venue_id INT(11) NOT NULL,
Film_id INT(11) NOT NULL,
PRIMARY KEY (screening_id)
);




//Create Films Table
CREATE TABLE films(
Film_id INT(11) NOT NULL AUTO_INCREMENT,
film_name VARCHAR(60) NOT NULL,
age_rating VARCHAR (3) NOT NULL,
description VARCHAR (60) NOT NULL,
film_rating FLOAT,
PRIMARY KEY (film_id)
);

//Create Venues Table
CREATE TABLE venues(
Venue_id INT(11) NOT NULL AUTO_INCREMENT,
Venue_name VARCHAR(50) NOT NULL,
postcode VARCHAR(10) NOT NULL,
lattitude FLOAT NOT NULL,
logitude FLOAT NOT NULL,
PRIMARY KEY (venue_id)
);
