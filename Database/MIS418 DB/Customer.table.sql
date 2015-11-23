CREATE TABLE [dbo].[Customer]
(
	CustomerID INT IDENTITY(1,1) NOT NULL, 
	Name VARCHAR(50),
	Address VARCHAR(255),
	-- This assumes that the phone number is either 17009998888 or at most 1 (700) 999-8888
	Phone VARCHAR(16),
	-- Notes about the customer, anything goes
	Note VARCHAR(255),
	OrderID INT,
	AccountID INT,

	CONSTRAINT pk_CustomerID PRIMARY KEY (CustomerID),
	CONSTRAINT fk_CustomerOrderID FOREIGN KEY (OrderID) REFERENCES [dbo].[Order](OrderID),
	CONSTRAINT fk_CustomerAccountID FOREIGN KEY (AccountID) REFERENCES [dbo].[Account](AccountID)
)
