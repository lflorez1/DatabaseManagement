--Question1
select customers.name, customers.city  
from customers
where city in (select city 
	      from products
	      group by city      
	      having count(city) in ( (select MAX(MaxCount) 
				      from (select count(city) AS MaxCount
				            from products 
				            group by products.city
				            ) AS Count
		   	            ) ) 
	      );
	      
--Question2
select name
from products
where priceUSD > (select avg(priceUSD)as avg
		  from products
		  )
order by name DESC;	

--Question3
select customers.name,pid,totalUSD 
from orders, customers
where customers.cid = orders.cid
order by totalUSD ASC;

--Question4
select customers.name,sum(coalesce(totalUSD,0) )
from orders right outer join customers on customers.cid = orders.cid
group by customers.name
order by name ASC;

--Question5
select customers.name, products.name, agents.name
from orders, customers, products, agents
where customers.cid = orders.cid 
  and products.pid = orders.pid 
  and agents.aid = orders.aid 
  and agents.city = 'Newark'

--Question6
select *
from (select orders.*, orders.qty*products.priceusd*(1-(discount/100)) as trueUSD
      from orders
      inner join products on orders.pid = products.pid
      inner join customers on orders.cid = customers.cid ) as comparingTable
where totalUSD != trueUSD;

--Question7
--Outer joins match all the values in one table that matches all the values in another table and whatever it does not match it gives null
--A right outer join will show the table on the right with the matching values of the left table 
--A left outer join will show the table on left with the matching values on the left 

--Left outer join
--All customers' information is shown along with the matching information in the orders table, for the customers that has no mathcing data it gives null
select *
from customers left outer join orders on customers.cid = orders.cid;

--Right outer join
--All order's information is shwong aling with the matching information from ordes
select *
from customers right outer join orders on customers.cid = orders.cid;

