SELECT DISTINCT e.officeID as theOfficeID, e.officeName as theOfficeName, e.city as theOfficeCity
FROM ElectedOffices e, OfficeHolders oh
WHERE e.state = 'CA' and EXISTS( SELECT * FROM OfficeHolders, Persons p1, Persons p2 WHERE p1.personID = oh.candidateID and p2.personID = candidateID and e.officeID = oh.officeID);