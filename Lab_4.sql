USE school_sport_clubs;

(SELECT 
	s.name as Sport,
    sg.location as Place
FROM sports as s
LEFT JOIN sportGroups as sg
ON s.id = sg.sport_id)
UNION
(SELECT 
	sports.name,
    sportGroups.location
FROM sports
RIGHT JOIN sportGroups
ON sports.id = sportGroups.sport_id);

SELECT 
	firstStud.name as Student1,
    secondStud.name as Student2,
    sports.name as Sport
FROM students as firstStud
JOIN students as secondStud
ON firstStud.id > secondStud.id
JOIN sports
ON (
	firstStud.id IN (
		SELECT student_id
		FROM student_sport
        WHERE  sportGroup_id IN (
			SELECT id from sportGroups
            WHERE sportGroups.sport_id = sports.id
        )
    )
)
AND(
	secondStud.id IN (
		SELECT student_id
        from student_sport
        WHERE sportGroup_id IN (
			SELECT id
            FROM sportGroups
            WHERE sportGroups.sport_id=sports.id
        )
    )
)
WHERE firstStud.id IN (
	SELECT student_id
    FROM student_sport
    WHERE sportGroup_id IN (
		SELECT 
			sportGroup_id
		FROM student_sport
        WHERE student_id = secondStud.id
    )
) ORDER BY Sport;


