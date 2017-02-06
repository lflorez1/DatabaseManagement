--Question1
select ordNumber, totalUSD
from Orders;

--Question2
select name, city
from Agents
where name = 'Smith';

--Question3
select pid, name, priceUSD, quantity
from Products
where quantity > 200100;

--Question4
select name, city
from Customers
where city = 'Duluth';

--Question5
select name
from Agents
where city != 'New York' and city != 'Duluth';

--Question6
select pid, name, city, quantity, priceUSD
from Products
where city != 'Dallas' and city != 'Duluth' and priceUSD>=1.00;

--Question7
select ordNumber, month, cid, aid, pid, qty, totalUSD
from Orders
where month = 'Feb' or month = 'May';

--Question8
select ordNumber, month, cid, aid, pid, qty, totalUSD
from Orders
where month = 'Feb' and totalUSD >= 600.00;

--Question9
select ordNumber
from Orders
where cid = 'c005';
