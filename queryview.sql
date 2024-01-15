SELECT DISTINCT w.candidateID, p.personName, w.officeID, w.electionDate
FROM Persons p, OfficeHolders oh, WronglyDeclaredWinnerView w
WHERE p.personID = w.candidateID 
AND oh.officeID = w.officeID 
AND oh.electionDate = w.electionDate 
AND w.candidateID = oh.candidateID;

/* Results of Fradulent Officeholder*/
/* candidateid |    personname    | officeid | electiondate
-------------+------------------+----------+--------------
           3 | Alexander Hilton |      101 | 2018-01-31
           9 | Penny Taylor     |      106 | 2005-05-15
(2 rows)
*/

UPDATE CandidatesForOffice 
SET wonElection = FALSE
WHERE candidateID = 9 
AND officeID = 106 
AND electionDate = DATE '2005-05-15';

SELECT DISTINCT w.candidateID, p.personName, w.officeID, w.electionDate
FROM Persons p, OfficeHolders oh, WronglyDeclaredWinnerView w
WHERE p.personID = w.candidateID 
AND oh.officeID = w.officeID 
AND oh.electionDate = w.electionDate 
AND w.candidateID = oh.candidateID;

/* Results if running Fradulent Officeholder after the update */
/*candidateid |    personname    | officeid | electiondate |    personname
-------------+------------------+----------+--------------+------------------
           3 | Alexander Hilton |      101 | 2018-01-31   | Alexander Hilton
(1 row)
*/

/*There is a change in the table now, since Penny Taylor was updated to FALSE in the winning of election, even though she holds the office*/