CREATE TABLE [dbo].[Instructor]
(
	InstructorID INT IDENTITY(1,1) NOT NULL,

	OfferingID INT,

	CONSTRAINT pk_InstructorID PRIMARY KEY (InstructorID),
	CONSTRAINT fk_InstructorOfferingID FOREIGN KEY (OfferingID) REFERENCES [dbo].[Offering](OfferingID)
)