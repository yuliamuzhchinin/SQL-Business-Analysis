
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;	
UPDATE ElectedOffices e
SET officeName = m.officeName, city = m.city, state = m.state, salary = NULL
FROM ModifyElectedOffices m
WHERE m.officeID = e.officeID;

INSERT INTO ElectedOffices(officeID, officeName, state, city, salary)
SELECT DISTINCT m.officeID, m.officeName, m.state, m.city, 12345.67
FROM ModifyElectedOffices m
WHERE m.officeID NOT IN (SELECT e.officeID FROM ElectedOffices e);
COMMIT TRANSACTION;



