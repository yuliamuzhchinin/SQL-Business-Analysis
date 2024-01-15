DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Persons (

personID int primary key,
personName varchar(40),
city varchar(40),
state char(2),
occupation varchar(20),
isFelon BOOLEAN

);

CREATE TABLE ElectedOffices (
officeID int, 
officeName varchar(20),
city varchar(40),
state char(2),
salary numeric(8,2), 
primary key (officeID)
);

CREATE TABLE Elections(

officeID int, 
electionDate date,
officeStartDate date,
officeEndDate date,
primary key (officeID, electionDate),
foreign key (officeID) REFERENCES ElectedOffices
);

CREATE TABLE CandidatesForOffice (

candidateID int, 
officeID int,
electionDate date,
party varchar(40),
votes int,
totalContributions numeric(9,2),
wonElection boolean,
primary key (candidateID, officeID, electionDate),
foreign key (candidateID) REFERENCES Persons(personID),
foreign key (officeID, electionDate) REFERENCES Elections(officeID, electionDate)
);

CREATE TABLE Contributions(
contributorID int,
candidateID int,
officeID int,
electionDate date,
contribution numeric (8,2),

primary key (contributorID, candidateID, officeID, electionDate),
foreign key (candidateID) REFERENCES Persons(personID),
foreign key (candidateID, officeID, electionDate) REFERENCES CandidatesForOffice(candidateID, officeID, electionDate)
);

CREATE TABLE OfficeHolders (
candidateID int,
officeID int,
electionDate date,
rating char(1),

primary key(candidateID, officeID, electionDate),
foreign key (candidateID, officeID, electionDate) REFERENCES CandidatesForOffice(candidateID, officeID, electionDate)
);