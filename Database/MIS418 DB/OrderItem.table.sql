CREATE TABLE [dbo].[OrderItem]
(
	OrderItemID INT IDENTITY(1,1) NOT NULL,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	Discount DECIMAL(3,2) NOT NULL DEFAULT 0.00,

	CONSTRAINT pk_OrderItemID PRIMARY KEY (OrderItemID),
	CONSTRAINT fk_OrderItemOrderID FOREIGN KEY (OrderID) REFERENCES [dbo].[Order](OrderID),
	CONSTRAINT fk_OrderItemProductID FOREIGN KEY (ProductID) REFERENCES [dbo].[Product](ProductID)
)
