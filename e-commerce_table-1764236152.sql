Create Database ECommerce

CREATE TABLE Customers (
Id int primary key IDENTITY,
Name nvarchar(30) NOT NULL,
Email nvarchar(30) NOT NULL unique,
Phone nvarchar(30) NOT NULL,
);
CREATE TABLE Orders (
	Id int primary key IDENTITY,
	OrderDate time(7) NOT NULL,
	Status varchar(40) NOT NULL,
	Customer_Id int foreign key References Customers(Id) ,
);



CREATE TABLE Categories (
	Id int primary key IDENTITY,
Name nvarchar(30) NOT NULL,
Description nvarchar(30) NOT NULL,	
);

CREATE TABLE Products (
Id int primary key IDENTITY,
Name nvarchar(30) NOT NULL,
Description nvarchar(30) NOT NULL,
Price decimal  ,
Category_Id int foreign key References Categories(Id) ,
);

CREATE TABLE Suppliers (
Id int primary key IDENTITY,
Name nvarchar(30) NOT NULL,
ContactInfo nvarchar(30) NOT NULL,
);

CREATE TABLE OrderItems (
    Id INT PRIMARY KEY IDENTITY,
    Quantity INT NOT NULL,
    UnitPriceQuantity INT NOT NULL,
	OrdersId int foreign key References Orders(Id) ,
	ProductId int foreign key References Products(Id) 
);


CREATE TABLE ProductSuppliers (
	Id int primary key IDENTITY,
	Products_Id int foreign key References Products(Id),
	Suplier_Id int foreign key References Suppliers(Id) ,

);



CREATE TABLE COUNTRIES (
	Id int primary key IDENTITY,
	Name nvarchar(30) NOT NULL,
);

CREATE TABLE CITIES(
	Id int primary key IDENTITY,
	Name nvarchar(30) NOT NULL,
	CountryId int foreign key References COUNTRIES(Id) ,
)



CREATE VIEW  CustomOrderSummary AS
SELECT c.Id,o.Status, c.Name, COUNT(o.Id) AS OrderCount
FROM Customers c
INNER JOIN Orders o ON c.Id = o.Customer_Id
WHERE o.Status > 5500
GROUP BY c.Id,o.Status, c.Name


select * from CustomOrderSummary 
order by Id


SELECT c.Id,o.Status, c.Name, COUNT(o.Id) AS OrderCount
FROM Customers c
INNER JOIN Orders o ON c.Id = o.Customer_Id
GROUP BY c.Id,o.Status, c.Name
order by c.Id;






SELECT o.Id,o.Quantity, COUNT(o.Id) AS OrderCount
FROM OrderItems o
INNER JOIN Products p ON p.Id = o.ProductId
GROUP BY o.Id,o.Quantity
order by o.Id;



SELECT SUM(OI.Quantity * OI.UnitPriceQuantity) AS GrandTotal
FROM OrderItems OI
GROUP BY OI.Id,OI.OrdersId,OI.Quantity,OI.UnitPriceQuantity
order by OI.Id;

