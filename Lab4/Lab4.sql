--Question 1
select city 
from agents 
where aid in (select aid
	      from orders
	      where cid = 'c006' 
	      );
	      
--Question2
select distinct pid
from orders
where aid in (select aid
	      from orders
	      where cid in (select cid
			    from customers
			    where city = 'Kyoto'
			    )
	      )
order by pid;

--Question3
select name, cid
from customers
where cid not in (select cid
	          from orders 
	          where  aid = 'a01'
	          );

--Question4
select cid
from customers
where cid in (select cid
	      from orders
	      where pid = 'p07' AND cid in (select cid
					    from orders
					    where pid ='p01'
					    )
	     );

--Question5
select pid
from products 
where pid in (select pid 
		from orders
		where aid <> 'a08'
	     )
order by pid DESC;

--Question6
select name, discount, city
from customers
where cid in (select cid 
	      from orders
	      where aid in (select aid
			    from agents
			    where city = 'New York' or city = 'Tokyo'
			    )
	      );
	     
--Question7
select *
from customers
where cid not in (select cid
		  from customers
		  where city = 'Duluth' or city ='London'
		  ) AND discount in (select discount
		                     from customers
				      where city = 'Duluth' or city ='London'
				     );

--Question8
--Check constraisn limit what the type of data can be inserted into a table. The constrains can range from year can only be entered as an integer or name can only be
--entered as texts. They are good for mantaining consistency in the data. If there are any  violations, the action will be dropped. 
--Constrains are necessary in order to mantain referencial integrity.
--Good way to use data constrains would be to specify in a table when is null or not null, when it is a primary key or foreign key, etc. 
--A data field not defined with a specific data type will destroy data integrity and create ambiguity.