/*************************************************************************************************
*
*	Type: 			Insert Procedure
*	Purpose:	
* 	Author:			timotei	
*	Create Date:	Dec 1, 2015
*	Revisions:
*		Author                    	Date       	Description                                       
*		------------------------- 	---------- 	------------------------------------------------- 
*************************************************************************************************/

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'insert_order')
	DROP PROCEDURE insert_order
GO


CREATE PROCEDURE dbo.insert_order
	@ProductID INT,
	@UserID Uniqueidentifier
AS

SET NOCOUNT ON
SET XACT_ABORT ON

BEGIN TRANSACTION

DECLARE @customerID INT
SELECT @customerID = CustomerID from Customer_User where UserID = @UserID

-- The insert values need to be changed
-- So far this solution is for prototype purposes only
INSERT INTO [Order]
(
	   [CustomerID]
      ,[PaymentTypeCode]
      ,[AccountID]
      ,[OrderDate]
      ,[RequiredDate]
      ,[ShippedDate]
      ,[ShipVia]
      ,[Freight]
)
VALUES
(
	@customerID
	,'acct'
	,1818
	,GETDATE()
	,GETDATE()
	,GETDATE()
	,1
	,rand() * 50
)

DECLARE @OrderID INT

SELECT @OrderID = SCOPE_IDENTITY()


INSERT INTO [OrderItem]
(
	   [OrderID]
      ,[ProductID]
      ,[Quantity]
      ,[Discount]
)
VALUES
(
	@OrderID
	,@ProductID
	,1
	,0
)

COMMIT TRANSACTION

GO
GRANT EXECUTE ON insert_order TO PUBLIC
GO