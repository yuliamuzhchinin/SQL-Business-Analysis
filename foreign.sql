ALTER TABLE Contributions 
	ADD CONSTRAINT contributorIDFK FOREIGN KEY(contributorID) REFERENCES Persons(personID)
	ON UPDATE CASCADE
	ON DELETE CASCADE;

ALTER TABLE Contributions
	ADD CONSTRAINT contributorFK FOREIGN KEY (candidateID, officeID, electionDate) REFERENCES CandidatesForOffice(candidateID, officeID, electionDate);
	
ALTER TABLE OfficeHolders
	ADD CONSTRAINT candidateIDFK FOREIGN KEY(candidateID, officeID, electionDate) REFERENCES CandidatesForOffice(candidateID, officeID, electionDate) 
	ON DELETE CASCADE;