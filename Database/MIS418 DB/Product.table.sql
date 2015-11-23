CREATE TABLE [dbo].[Product]
(
	ProductID INT IDENTITY(1,1) NOT NULL, 
	Name VARCHAR(255),

	OrderItemID INT,

	CONSTRAINT pk_ProductID PRIMARY KEY (ProductID),
	CONSTRAINT fk_ProductOrderItemID FOREIGN KEY (OrderItemID) REFERENCES [dbo].[OrderItem](OrderItemID)
)
