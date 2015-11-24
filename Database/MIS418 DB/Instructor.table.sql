﻿CREATE TABLE [dbo].[Instructor]
(
	InstructorID INT IDENTITY(1,1) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	GivenNames VARCHAR(255) NOT NULL,
	HireDate DATETIME NOT NULL DEFAULT GETDATE(),

	CONSTRAINT pk_InstructorID PRIMARY KEY (InstructorID)
)