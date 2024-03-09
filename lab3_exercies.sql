USE school_sport_clubs;

INSERT INTO students
VALUES(NULL, "Ivan Ivanov Ivanov", 9207186371, " София-Сердика", "0888892950", "10");

SELECT *
FROM students
ORDER BY students.name ASC;

DELETE FROM students
WHERE id = 7;

SELECT
	students.name,
    sports.name
FROM students
JOIN student_sport
ON student_sport.student_id = students.id
JOIN sportgroups
ON sportgroups.id = student_sport.sportGroup_id
JOIN sports
ON sports.id = sportgroups.sport_id;

SELECT
	students.name,
    students.class,
    sportgroups.id
FROM students
JOIN student_sport
ON student_sport.student_id = students.id
JOIN sportgroups
ON sportgroups.id = student_sport.sportGroup_id
WHERE sportgroups.dayOfWeek = "Monday";

SELECT 
	coaches.name
FROM coaches
JOIN sportgroups
ON sportgroups.coach_id = coaches.id
JOIN sports
ON sports.id = sportgroups.sport_id
WHERE sports.name = "Football";

SELECT 
	sportgroups.location,
    sportgroups.dayOfWeek,
    sportgroups.hourOfTraining
FROM sportgroups
JOIN sports
ON sports.id = sportgroups.sport_id
WHERE sports.name = "Volleyball";

SELECT 
	sports.name
FROM students
JOIN student_sport
ON students.id = student_sport.student_id
JOIN sportgroups
ON student_sport.sportGroup_id = sportgroups.id
JOIN sports
ON sports.id = sportgroups.sport_id
WHERE students.name = "Iliyan Ivanov";

SELECT 
	students.name
FROM students
JOIN student_sport
ON students.id = student_sport.student_id
JOIN sportgroups
ON student_sport.sportGroup_id = sportgroups.id
JOIN coaches 
ON coaches.id = sportgroups.coach_id
WHERE coaches.name = "Ivan Todorov Petkov";



	