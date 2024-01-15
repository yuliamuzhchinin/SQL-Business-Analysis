/* violates the first reference constraint */
INSERT INTO Contributions(contributorID, candidateID, officeID, electionDate, contribution)
VALUES(20, 20, 113, DATE '2018-01-31', 100);
/* violates the second reference constraint */
INSERT INTO Contributions (contributorID, candidateID, officeID, electionDate, contribution)
VALUES (11, 25, 200, DATE '2013-02-13', 5000);
/* violates the third reference constraint */
INSERT INTO OfficeHolders(candidateID, officeID, electionDate, rating)
VALUES (20, 120, DATE '2013-02-13','D');

/* successfully updates the first general check */
UPDATE Contributions c 
SET contribution = 6000;

/* fails to update the general check */
UPDATE Contributions  
SET contribution = 0;

/* successfully updates the second general check */
UPDATE Elections 
SET officeStartDate = '2019-02-17', officeEndDate = '2020-02-17';

/* fails to update the second general check */
UPDATE Elections 
SET officeStartDate = '2021-02-17', officeEndDate = '2020-02-17';

/* successfully updates the third general check */
UPDATE CandidatesForOffice
SET votes = NULL, wonElection = NULL;

/* fails to update the third general check */
UPDATE CandidatesForOffice
SET votes = NULL, wonElection = TRUE;
