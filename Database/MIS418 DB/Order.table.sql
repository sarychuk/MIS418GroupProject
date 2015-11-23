CREATE TABLE [dbo].[Order]
(
	OrderID INT IDENTITY(1,1) NOT NULL, 
	
	OrderItemID INT,

	CONSTRAINT pk_OrderID PRIMARY KEY (OrderID),
	CONSTRAINT fk_OrderOrderItemID FOREIGN KEY (OrderItemID) REFERENCES [dbo].[OrderItem](OrderItemID)
)
