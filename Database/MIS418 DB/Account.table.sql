CREATE TABLE [dbo].[Account]
(
	AccountID INT IDENTITY(1,1) NOT NULL,	
	AccountType	VARCHAR(10) DEFAULT 'Bronze',
	CustomerID INT NOT NULL,
	AccountStartDate DATETIME NOT NULL DEFAULT GETDATE(),
	CreditLimit SMALLMONEY NOT NULL,

	CONSTRAINT pk_AccountAccountID PRIMARY KEY (AccountID),
	CONSTRAINT fk_AccountCustomerID FOREIGN KEY (CustomerID) REFERENCES [dbo].[Customer]
)
