/*Q-1 Who is the Senior most employee based on job title */
select * from employee
order by levels desc
limit 1;

/*Q-2 Which Countries have the most invoices*/
select count(billing_country) as counts,billing_country from invoice
group by billing_country
order by counts desc;

/*Q-3 What are Top 3 values of total invoices */
select * from invoice
order by total desc
limit 3;

/*Q-4 
Which city has the best Customers? we would like to throw a promotional Music Festival in the city we made the most money
write a query that returns one city that has the highest sum of invoices totals. Return both the city name & sum of all invoice totals*/
select sum(total) as invoice_total ,billing_city from invoice
group by billing_city
order by invoice_total desc
limit 5;

/*Q-5 Who is the best customer? the customer who has spent the most money will be declared the best customer.
write a query that returns the person who has spent the most money*/
select customer.customer_id,sum(invoice.total) as totalsales
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by totalsales desc
LIMIT 1;

/* Moderate level**/
/*Question-->1
WRITE QUERY TO RETURN THE EMAILS, FIRST_NAME,LAST_NAME & GENRE OF ALL ROCK MUSIC LISTENERS. 
RETURN YOUR LIST ORDERED  ALPHABETICALLY  BY EMAILS STARTING WITH A ????*/
select email,first_name,last_name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
where track_id in( select track_id from track join genre on track.genre_id=genre.genre_id
where genre.name ='Rock')
order by email,first_name,last_name;

/*Question-->2
LET’S INVITE THE ARTISTS WHO HAVE WRITTEN THE MOST ROCK MUSIC IN OUR DATASETS,
WRITE A QUERY THAT RETURNS THE  ARTIST NAME 
AND TOTAL TRACK COUNT OF THE TOP 10 ROCKS BANDS */
select artist.artist_id,count(artist.artist_id) as number_of_songs,artist.name
from track
join album on album.album_id=track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id=track.genre_id
where genre.name= 'Rock'
group by artist.artist_id,name
order by number_of_songs desc
limit 10
;

/*Question-->3
RETURN ALL THE TRACK NAMES THAT HAVE A SONG LENGTH LONGER THAN THE AVERAGE SONG LENGTH.
RETURN THE NAME AND MILLISECONDS FOR EACH TRACK. ORDER BY THE SONG LENGTH WITH THE LONGEST SONGS LISTED FIRST ?
 */
select name,milliseconds from track
where milliseconds > (select avg(milliseconds) as avg_track_length
from track)
order by milliseconds desc
limit 3;

/* other steps*/
select name,milliseconds from track
where milliseconds >251500
order by milliseconds desc;




















































/*Q-1 */

/*Q-1 */

/*Q-1 */

/*Q-1 */
   