SELECT DISTINCT p.personID, p.occupation
FROM Persons p, OfficeHolders oh, CandidatesForOffice c, Elections e
WHERE EXISTS (SELECT * from Persons, CandidatesForOffice WHERE p.personID = candidateID)
and NOT EXISTS (SELECT * from Persons, OfficeHolders WHERE p.personID = candidateID);