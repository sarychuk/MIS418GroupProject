CREATE TABLE [dbo].[ProductReview]
(
	ProductReviewID INT IDENTITY(1,1) NOT NULL,
	ReviewStar INT NOT NULL DEFAULT 3,
	ReviewText VARCHAR(8000) NOT NULL,
	ReviewedBy uniqueidentifier NOT NULL,
	ProductID INT NOT NULL,

	CONSTRAINT pk_ProductReviewID PRIMARY KEY (ProductReviewID),
	CONSTRAINT fk_ProductReviewCustomer FOREIGN KEY (ReviewedBy) REFERENCES [dbo].[aspnet_Users](UserID),
	CONSTRAINT fk_ProductReviewProduct FOREIGN KEY (ProductID) REFERENCES [dbo].[Product](ProductID)
)