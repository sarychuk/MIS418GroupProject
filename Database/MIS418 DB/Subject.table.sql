CREATE TABLE [dbo].[Subject]
(
	SubjectID INT IDENTITY(1,1) NOT NULL, 
	Name VARCHAR(255),

	ProductID INT,
	WorkshopID INT,
	CourseID INT,

	CONSTRAINT pk_SubjectID PRIMARY KEY (SubjectID),
	CONSTRAINT fk_SubjectProductID FOREIGN KEY (ProductID) REFERENCES [dbo].[Product](ProductID),
	CONSTRAINT fk_SubjectWorkshopID FOREIGN KEY (WorkshopID) REFERENCES [dbo].[Workshop](WorkshopID),
	CONSTRAINT fk_SubjectCourseID FOREIGN KEY (CourseID) REFERENCES [dbo].[Course](CourseID)
)
