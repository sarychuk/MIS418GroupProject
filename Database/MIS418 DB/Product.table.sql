CREATE TABLE [dbo].[Product]
(
	ProductID INT IDENTITY(1,1) NOT NULL, 
	ProductName VARCHAR(255) NOT NULL,
	TopicCode VARCHAR(20) NOT NULL,
	ProductTypeCode VARCHAR(50) NOT NULL,
	Style VARCHAR(50) NOT NULL,
	QuantityPerUnit INT NOT NULL,
	UnitPrice SMALLMONEY NOT NULL,
	UnitsInStock INT,
	UnitsOnOrder INT,
	ReorderLevel INT,
	Discontinued BIT,

	CONSTRAINT pk_ProductID PRIMARY KEY (ProductID)
)
