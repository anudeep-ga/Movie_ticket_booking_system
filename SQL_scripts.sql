# 1 Top 5 States with most no of screens
with cte1 as (select c.state, sum(t.numberofscreens) as Total_no_of_screens
from city c join theatre t on c.idcity = t.cityid
group by c.state)

select * from cte1 c1
where 5 > (select count(c1.state) from cte1 c2 where c1.Total_no_of_screens < c2.Total_no_of_screens)
order by Total_no_of_screens desc;

# 2 which genre has most R rated
select genre, count(Certificate) No_of_movies
from movie
where Certificate in ('R','A')
group by Genre
order by No_of_movies desc;

# 3  Least watched genre/highest watched 
select m.genre, sum(b.seats) as total_tickets
from movie m join shows s on m.idmovie = s.movieid join booking b on s.idshow = b.showid
where b.status = 'Booked'
group by m.genre
order by total_tickets desc;

# 4 which month has most no of bookings
select month(timestamp) as Month, sum(seats) as Total_Tickets from booking 
where status = 'booked'
group by month(timestamp)
order by sum(seats) desc;

# 5 how does rating affect movie
select m.Rating, sum(b.seats) as Tickets_Booked
from booking b join shows s on b.showid = s.idshow
join movie m on s.movieid = m.idmovie
where b.status = 'booked'
group by m.rating
order by sum(b.seats) desc;

# 6 City with most no of bookings
with cte1 as (select c.name, sum(b.seats) as Bookings
from city c join theatre t on c.idcity = t.cityid join theaterscreen ts on t.idcinema = ts.cinemaid 
join shows s on ts.idscreen = s.screenid join booking b on s.idshow = b.showid
group by c.idcity)

select name as city from cte1
where Bookings = (select max(Bookings) from cte1);

# 7 All time hit - Most No of Tickets sold
with blockbuster_cte as (
select m.title, sum(b.seats) as total_tickets
from movie m join shows s on m.idmovie = s.movieid join booking b on s.idshow = b.showid
group by m.title)

select title as All_time_hit, Total_tickets 
from blockbuster_cte
where total_tickets = (select max(total_tickets) from blockbuster_cte);

# 8 Gold users - Users with more than 50 tickets booked in total
select u.name as Gold_Users, sum(b.seats) as Total_Tickets
from Booking b join user u on b.iduser = u.iduser
group by u.name
having sum(b.seats) >= 50
order by Total_Tickets desc;

#9 No of tickets sold in each language
select m.language, sum(b.seats) as total_tickets
from movie m join shows s on m.idmovie = s.movieid join booking b on s.idshow = b.showid
group by m.language;

# 10 Top 5 Theatres with most occupancy in the year 2022
with cte1 as (select t.idcinema, t.name as Theatre, sum(b.seats) as Booked_Seats
from theatre t join theaterscreen ts on t.idcinema = ts.cinemaid 
join shows s on ts.idscreen = s.screenid join booking b on s.idshow = b.showid
where year(b.timestamp) = 2022 and b.status = 'Booked'
group by t.idcinema),

cte2 as (select t.idcinema, t.name, sum(ts.totalseats) as Total_seats
from theatre t join theaterscreen ts on t.idcinema = ts.cinemaid
group by t.idcinema),

cte3 as (select a.Theatre, (a.Booked_seats/b.Total_Seats)*100 as Occupancy
from cte1 a join cte2 b on a.idcinema = b.idcinema)

select * from cte3 c1
where 5 > (select count(c1.Theatre) from cte3 c2 where c1.Occupancy < c2.Occupancy)  
order by Occupancy desc;

# 11 Ticket sales in each state
select c.state, sum(b.seats) as Booked_Seats
from city c join theatre t on c.idcity = t.cityid join theaterscreen ts on t.idcinema = ts.cinemaid 
join shows s on ts.idscreen = s.screenid join booking b on s.idshow = b.showid
group by c.state