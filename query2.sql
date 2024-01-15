SELECT p1.personName as contributorName, p2.personName as candidateName, c.contribution 
FROM CandidatesForOffice cfo, Contributions c, Persons p1, Persons p2
WHERE cfo.party = 'Gold'and p1.personID = c.contributorID and p2.personID = c.candidateID and cfo.candidateID = c.candidateID and c.electionDate = cfo.electionDate
ORDER BY c.contribution DESC, p1.personName ASC