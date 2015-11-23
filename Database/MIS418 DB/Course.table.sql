CREATE TABLE [dbo].[Course]
(
	CourseID INT IDENTITY(1,1) NOT NULL, 
	Name VARCHAR(255),

	OrderItemID INT,
	CourseContentPageID INT,

	CONSTRAINT pk_CourseID PRIMARY KEY (CourseID),
	CONSTRAINT fk_CourseOrderItemID FOREIGN KEY (OrderItemID) REFERENCES [dbo].[OrderItem](OrderItemID),
	CONSTRAINT fk_CourseCourseContentPageID FOREIGN KEY (CourseContentPageID) REFERENCES [dbo].[CourseContentPage](CourseContentPageID)
)
