
# Movie Ticket Booking System

## Problem Statement

The traditional way of buying tickets for a movie is that the customer needs to go to the theatre,
stand in the queue for hours and buy tickets. This is a more time consuming process both for
the customer and the theatre owners.

## Goal
Our goal is to design a database to streamline the process of booking tickets online, which helps
the users to select shows and seats of their choice and also makes it easier for the theatre owners
to control the crowd and play movies on time.

## Requirements:
The system must be able to provide a list of the cities where affiliate theaters are found. Each
movie theater may have several halls, and each hall may host one film show at a time. There
will be several showings of each film. Movies should be searchable by title, language, genre,
release date, and city name for the benefit of customers. When a consumer chooses a movie,
the service needs to provide the theaters showing it and the shows it has scheduled. The
customer ought to be able to choose a show at a specific theater and purchase tickets. The
customer should be shown the theater's seating arrangement by the service. The customer needs
to be allowed to pick from a variety of seats in accordance with their preferences. The user
should be able to tell the difference between booked and available seats. When a new movie is
released, as well as when a booking is made or canceled, the system should notify users.
Customers using our system should be able to pay with debit or with credit card. No two
consumers should be able to reserve the same seat, according to the system.

## EER Diagram

![Image](https://github.com/anudeep-ga/Movie_ticket_booking_system/blob/main/movie_EER.png?raw=true)

## UML Diagram

![Image](https://github.com/anudeep-ga/Movie_ticket_booking_system/blob/main/movie_UML.png?raw=true)

## Conclusion

This use case demonstrated the implementation of a database in MySQL and NoSQL
including querying to show the functionality of the database. The database was also accessed
via python and some data visualizations were produced using SQL querying. The Database can be further improved by enforcing it in salesforce. We can add validation
rules and permission sets which can restrict access to specific users and by using dashboards
and reports we can generate insights which can be later used by data scientists to make
recommendations for the people.
