--Question1
select city
from agents, orders
where agents.aid = orders.aid
  AND cid = 'c006';

--Question2
select distinct pid
from orders, customers, agents
where orders.cid = customers.cid 
  AND orders.aid = agents.aid 
  AND customers.city = 'Kyoto'
order by pid DESC;

--Question3
select name 
from customers
where cid not in (select cid
	          from orders
	          );
	          
--Question4
select distinct name
from customers left outer join orders on customers.cid = orders.cid
where orders.cid is null;

--Question5
select customers.name AS "Customer", agents.name AS "Agent"
from customers, agents, orders
where customers.cid = orders.cid 
  AND agents.aid = orders.aid 
  AND agents.city = customers.city;

--Question6
select distinct customers.name AS "Customer", agents.name AS "Agent", agents.city AS "SharedCity"
from customers, agents, orders
where customers.city = agents.city;

--Questiom7
select customers.name, customers.city  
from customers
where city in (select city 
	      from products
	      group by city      
	      having count(city) in ( (select MIN(MinimumCount) 
				      from (select count(city) AS MinimumCount
				            from products 
				            group by products.city
				            ) AS Count
		   	            ) ) 
	      );						