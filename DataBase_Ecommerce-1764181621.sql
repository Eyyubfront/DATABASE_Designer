CREATE TABLE [Customers] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Name] nvarchar(30) NOT NULL,
	[Email] nvarchar(30) NOT NULL,
	[Phone] nvarchar(30) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [Products] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Name] nvarchar(40) NOT NULL,
	[Description] nvarchar(20) NOT NULL,
	[Category_Id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [Categories] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Name] nvarchar(40) NOT NULL,
	[Description] nvarchar(20) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [Orders] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[OrderDate] time(7) NOT NULL,
	[Status] nvarchar(40) NOT NULL,
	[Customer_Id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [Suppliers] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Name] nvarchar(50) NOT NULL,
	[ContacInfo] nvarchar(60) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [OrderItems] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Quantity] int NOT NULL,
	[UnitPrice] int NOT NULL,
	[Orders_Id] int NOT NULL,
	[Products_Id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [ProductSuppliers] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[Products_Id] int NOT NULL,
	[Suplier_Id] int NOT NULL,
	PRIMARY KEY ([id])
);


ALTER TABLE [Products] ADD CONSTRAINT [Products_fk3] FOREIGN KEY ([Category_Id]) REFERENCES [Categories]([id]);

ALTER TABLE [Orders] ADD CONSTRAINT [Orders_fk3] FOREIGN KEY ([Customer_Id]) REFERENCES [Customers]([id]);

ALTER TABLE [OrderItems] ADD CONSTRAINT [OrderItems_fk3] FOREIGN KEY ([Orders_Id]) REFERENCES [Orders]([id]);

ALTER TABLE [OrderItems] ADD CONSTRAINT [OrderItems_fk4] FOREIGN KEY ([Products_Id]) REFERENCES [Products]([id]);
ALTER TABLE [ProductSuppliers] ADD CONSTRAINT [ProductSuppliers_fk1] FOREIGN KEY ([Products_Id]) REFERENCES [Products]([id]);

ALTER TABLE [ProductSuppliers] ADD CONSTRAINT [ProductSuppliers_fk2] FOREIGN KEY ([Suplier_Id]) REFERENCES [Suppliers]([id]);