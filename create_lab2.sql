DROP SCHEMA Lab2 CASCADE;
CREATE SCHEMA Lab2;

CREATE TABLE Persons (

personID int primary key,
personName varchar(40) NOT NULL UNIQUE,
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
primary key (officeID),
unique(officeName,city,state)
);

CREATE TABLE Elections(

officeID int, 
electionDate date,
officeStartDate date NOT NULL,
officeEndDate date,
primary key (officeID, electionDate),
foreign key (officeID) REFERENCES ElectedOffices
);

CREATE TABLE CandidatesForOffice (

candidateID int, 
officeID int,
electionDate date,
party varchar(20),
votes int,
totalContributions numeric(9,2),
wonElection boolean,
primary key (candidateID, officeID, electionDate),
foreign key (candidateID) REFERENCES Persons(personID),
foreign key (officeID, electionDate) REFERENCES Elections(officeID, electionDate),
unique(officeID, electionDate, party)
);

CREATE TABLE Contributions(
contributorID int,
candidateID int,
officeID int,
electionDate date,
contribution numeric (8,2) NOT NULL,

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