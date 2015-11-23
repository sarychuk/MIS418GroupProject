CREATE TABLE [dbo].[Workshop]
(
	WorkshopID INT IDENTITY(1,1) NOT NULL, 
	
	OrderItemID INT,
	OfferingID INT,

	CONSTRAINT pk_WorkshopID PRIMARY KEY (WorkshopID),
	CONSTRAINT fk_WorkshopOrderItemID FOREIGN KEY (OrderItemID) REFERENCES [dbo].[OrderItem](OrderItemID),
	CONSTRAINT fk_WorkshopOfferingID FOREIGN KEY (OfferingID) REFERENCES [dbo].[Offering](OfferingID)
)
