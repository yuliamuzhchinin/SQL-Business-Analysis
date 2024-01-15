SELECT DISTINCT e.officeID as theOfficeID, e.electionDate as theElectionDate, e.officeStartDate as theOfficeStartDate, e.officeEndDate as theOfficeEndDate
FROM Persons p, Elections e, CandidatesForOffice c
WHERE p.isFelon = true and c.candidateID = p.personID and e.officeID = c.officeID and e.electionDate = c.electionDate;