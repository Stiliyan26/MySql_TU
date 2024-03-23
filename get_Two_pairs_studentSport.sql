USE school_sport_clubs;

SELECT
	firstStud.name,
    secondStud.name,
    sports.name
FROM students AS firstStud
JOIN students AS secondStud
	ON firstStud.id > secondStud.id
JOIN sports
	ON firstStud.id IN ( #Returns if the first student is playing this sport
		SELECT 
			student_id
        FROM student_sport
        WHERE student_sport.sportGroup_id IN (
			SELECT
				id
			FROM SportGroups 
            WHERE SportGroups.sport_id = sports.id
        )
    )
    AND secondStud.id IN ( #Returns if the second student is playing this sport
		SELECT
			student_id
		FROM student_sport
        WHERE student_sport.sportGroup_id IN (
			SELECT
				id
			FROM SportGroups
            WHERE SportGroups.sport_id = sports.id
        )
    )
    WHERE firstStud.id IN ( #Returns if the students pair are in one group
		SELECT 
			student_id
		FROM student_sport
        WHERE student_sport.sportGroup_id IN ( #Returns all groups where secondStud is involved
			SELECT
				sportGroup_id
			FROM student_sport
            WHERE student_id = secondStud.id
        )
    );
