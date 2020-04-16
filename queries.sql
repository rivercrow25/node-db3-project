-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select categoryname, productname
from category as c
join product as p on c.id = p.CategoryId

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id, shipper.CompanyName
from [order] as o
join shipper on shipper.Id = o.ShipVia
where o.OrderDate < date('2012-08-09');

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select product.ProductName, orderDetail.Quantity
from orderdetail
join product on product.Id = orderdetail.ProductId
join [order] as o on o.Id = orderdetail.OrderId
where o.Id = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id, c.CompanyName, e.LastName
from [order] as o
join customer as c on c.Id = o.CustomerId
join employee as e on e.Id = o.EmployeeId
