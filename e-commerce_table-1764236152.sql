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

