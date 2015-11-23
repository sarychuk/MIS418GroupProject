CREATE TABLE [dbo].[Facility]
(
	FacilityID INT IDENTITY(1,1) NOT NULL, 

	OfferingID INT,

	CONSTRAINT pk_FacilityID PRIMARY KEY (FacilityID),
	CONSTRAINT fk_FacilityOfferingID FOREIGN KEY (OfferingID) REFERENCES [dbo].[Offering](OfferingID)
)