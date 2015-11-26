CREATE TABLE [dbo].[Customer_User]
(
	UserID uniqueidentifier NOT NULL,
	CustomerID INT NOT NULL

	CONSTRAINT pk_UserID_CustomerID PRIMARY KEY (UserID,CustomerID),
	CONSTRAINT fk_UserID FOREIGN KEY (UserID) REFERENCES [dbo].[aspnet_Users](UserId),
	CONSTRAINT fk_CustomerID FOREIGN KEY (CustomerID) REFERENCES [dbo].[Customer](CustomerID)
)
