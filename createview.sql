CREATE VIEW WronglyDeclaredWinnerView(candidateID, officeID, electionDate, numCandidatesWithMoreVotes) AS
SELECT DISTINCT c1.candidateID, c1.officeID, c1.electionDate, COUNT(c2.votes)
FROM CandidatesForOffice c1,  CandidatesForOffice c2, OfficeHolders oh
WHERE oh.officeID = c1.officeID 
AND oh.candidateID = c1.candidateID 
AND oh.electionDate = c1.electionDate 
AND c2.electionDate = c1.electionDate 
AND c1.wonElection = TRUE 
AND c2.votes > c1.votes
GROUP BY c1.candidateID, c1.officeID, c1.electionDate
HAVING COUNT(c2.votes > c1.votes) >= 2;
