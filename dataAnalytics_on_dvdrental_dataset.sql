select count(*) from customer;

select count(*) from store;

select min(payment_date) as min_date, max(payment_date) as max_date from payment;

select p.payment_id,p.rental_id,p.amount,r.inventory_id,i.film_id,f.title from payment as p
join rental as r on p.rental_id = r.rental_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id

-- following query is used to get the revenue of each film
select sum(p.amount) as revenue, f.title from payment as p
join rental as r on p.rental_id = r.rental_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
group by f.title
order by sum(p.amount) desc

-- find the top city that is providing us the revenue based on the film source
SELECT f.title,ct.city,sum(p.amount)as revenue FROM film as f
join inventory as i ON f.film_id = i.inventory_id
join rental as r ON i.inventory_id = r.inventory_id
join payment as p ON r.rental_id = p.rental_id
join customer as c ON c.customer_id = p.customer_id
join address as a ON a.address_id = c.address_id
join city as ct ON ct.city_id = a.city_id
GROUP BY f.title,ct.city
ORDER BY sum(p.amount) desc
