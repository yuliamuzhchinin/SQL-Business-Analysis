CREATE OR REPLACE FUNCTION
improveSomeRatingsFunction (IN theParty VARCHAR(20), IN maxRatingImprovements INTEGER)
RETURNS INTEGER AS $$


    DECLARE numOfImprovements	INTEGER;
	DECLARE cursorRead RECORD;  /* The rating for improvement */

    DECLARE improveCursor CURSOR FOR
    	    SELECT *
            FROM CandidatesForOffice c, OfficeHolders oh
            WHERE c.party = theParty AND c.candidateID = oh.candidateID AND c.electionDate = oh.electionDate AND oh.officeID = c.officeID
			ORDER BY c.electionDate DESC;

    BEGIN

	-- Input Validation
	IF maxRatingImprovements <= 0 THEN
	    RETURN -1;		/* Illegal value of maxFired */
	    END IF;

        numOfImprovements := 0;

        OPEN improveCursor;
		
        LOOP
			
			
			fetch improveCursor INTO cursorRead;
            EXIT WHEN NOT FOUND OR numOfImprovements >= maxRatingImprovements;

			IF cursorRead.rating = 'B' THEN
				UPDATE OfficeHolders 
				SET rating = 'A'  
				WHERE OfficeHolders.officeID = cursorRead.officeID AND OfficeHolders.candidateID = cursorRead.candidateID AND OfficeHolders.electionDate = cursorRead.electionDate;
				numOfImprovements := numOfImprovements + 1;
			END IF;
			IF cursorRead.rating = 'C' THEN
				UPDATE OfficeHolders
				SET rating = 'B' 
				WHERE OfficeHolders.officeID = cursorRead.officeID AND OfficeHolders.candidateID = cursorRead.candidateID AND OfficeHolders.electionDate = cursorRead.electionDate;
				numOfImprovements := numOfImprovements + 1;
			END IF;
			IF cursorRead.rating = 'D' THEN
				UPDATE OfficeHolders
				SET rating = 'C' 
				WHERE OfficeHolders.officeID = cursorRead.officeID AND OfficeHolders.candidateID = cursorRead.candidateID AND OfficeHolders.electionDate = cursorRead.electionDate;
				numOfImprovements := numOfImprovements + 1;
			END IF;
			IF cursorRead.rating = 'F' THEN
				UPDATE OfficeHolders
				SET rating = 'D' 
				WHERE OfficeHolders.officeID = cursorRead.officeID AND OfficeHolders.candidateID = cursorRead.candidateID AND OfficeHolders.electionDate = cursorRead.electionDate;
				numOfImprovements := numOfImprovements + 1;
			END IF;
			
        END LOOP;
        CLOSE improveCursor;

	RETURN numOfImprovements;


    END

$$ LANGUAGE plpgsql;
