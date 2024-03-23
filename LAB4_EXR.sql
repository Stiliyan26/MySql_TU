USE school_sport_clubs;

SELECT 
	students.name,
    students.class,
    students.phone
FROM students
JOIN student_sport
ON students.id = student_sport.student_id
JOIN sportgroups
ON sportgroups.id = student_sport.sportGroup_id
JOIN sports
ON sportGroups.sport_id = sports.id
WHERE sports.name = "Football";

SELECT 
	coaches.name
FROM coaches
JOIN sportgroups
ON sportgroups.coach_id = coaches.id
JOIN sports
ON sports.id = sportgroups.sport_id
WHERE sports.name = "Volleyball";

SELECT 
	coaches.name,
    sports.name
FROM students
JOIN student_sport
ON students.id = student_sport.student_id
JOIN sportgroups
ON sportgroups.id = student_sport.sportGroup_id
JOIN sports
ON sportGroups.sport_id = sports.id
JOIN coaches
ON sportgroups.coach_id = coach_id
WHERE students.name = "Iliyan Ivanov";

SELECT
	s.name,
    s.class,
    sg.location,
    coaches.name
FROM students as s
JOIN student_sport
ON student_sport.student_id = s.id
JOIN sportgroups as sg
ON sg.id = student_sport.sportGroup_id
JOIN coaches
ON coaches.id = sg.coach_id
WHERE sg.hourOfTraining = "08:00:00";



