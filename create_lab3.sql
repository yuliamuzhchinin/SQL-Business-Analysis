-- CSE 182 Spring 2023 Lab3 create file
-- Do not modify this file


DROP SCHEMA Lab3 CASCADE;
CREATE SCHEMA Lab3;


-- Persons(personID, personName, city, state, occupation, isFelon)
CREATE TABLE Persons (
    personID INT PRIMARY KEY,
    personName VARCHAR(40),
    city VARCHAR(40),
    state CHAR(2),
    occupation VARCHAR(20),
    isFelon BOOLEAN
);


-- ElectedOffices(officeID, officeName, city, state, salary)
CREATE TABLE ElectedOffices (
    officeID INT PRIMARY KEY,
    officeName VARCHAR(20),
    city VARCHAR(40),
    state CHAR(2),
    salary NUMERIC(8,2)
);


-- Elections(officeID, electionDate, officeStartDate, officeEndDate)
CREATE TABLE Elections (
    officeID INT,
    electionDate DATE,
    officeStartDate DATE,
    officeEndDate DATE,
    PRIMARY KEY (officeID, electionDate),
    FOREIGN KEY (officeID) REFERENCES ElectedOffices
);


-- CandidatesForOffice(candidateID, officeID, electionDate, party, votes, totalContributions, wonElection)
CREATE TABLE CandidatesForOffice (
    candidateID INT REFERENCES Persons(personID),
    officeID INT,
    electionDate DATE,
    party VARCHAR(20),
    votes INTEGER,
    totalContributions NUMERIC(9,2),
    wonElection BOOLEAN,
    PRIMARY KEY (candidateID, officeID, electionDate),
    FOREIGN KEY (officeID, electionDATE) REFERENCES Elections
);


-- Contributions(contributorID, candidateID, officeID, electionDate, contribution)
CREATE TABLE Contributions (
    contributorID INT,
    candidateID INT,
    officeID INT,
    electionDate DATE,
    contribution NUMERIC(8,2),
    PRIMARY KEY (contributorID, candidateID, officeID, electionDate)
);


-- OfficeHolders(candidateID, officeID, electionDate, rating)
CREATE TABLE OfficeHolders (
    candidateID INT,
    officeID INT,
    electionDate DATE,
    rating CHAR(1),
    PRIMARY KEY (candidateID, officeID, electionDate)
);


-- ModifyElectedOffices(officeID, officeName, city, state)
CREATE TABLE ModifyElectedOffices (
    officeID INT PRIMARY KEY,
    officeName VARCHAR(20),
    city VARCHAR(40),
    state CHAR(2)
);
