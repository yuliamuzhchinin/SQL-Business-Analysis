SELECT DISTINCT p.personName, oh.rating, e.salary, p.occupation, e.officeName
FROM Persons p, OfficeHolders oh, ElectedOffices e 
WHERE p.personID = oh.candidateID
AND e.salary > 125000 
AND e.officeID = oh.officeID 
AND p.occupation IS NOT NULL
AND e.officeName like '%or' 
AND (oh.rating = 'A' or oh.rating = 'B');