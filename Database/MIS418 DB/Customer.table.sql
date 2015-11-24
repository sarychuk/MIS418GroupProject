CREATE TABLE [dbo].[Customer]
(
	CustomerID INT IDENTITY(1,1) NOT NULL, 
	MaxCreditLimit SMALLMONEY,
	LastName VARCHAR(50) NOT NULL,
	GivenNames VARCHAR(50) NOT NULL,
	EmailAddress VARCHAR(100),
	Address1 VARCHAR(255),
	Adress2 VARCHAR(255),
	Municipality VARCHAR(255),
	ProvinceStateCode VARCHAR(2) NOT NULL,
	PostalCode VARCHAR(7) NOT NULL,
	PhoneAreaCode INT NOT NULL,
	PhoneNumber INT NOT NULL,
	PhoneExtension INT,
	EmployeeSalesRepID INT,

	CONSTRAINT pk_CustomerID PRIMARY KEY (CustomerID)
)
