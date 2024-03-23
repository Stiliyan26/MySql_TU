USE school_sport_clubs;

SELECT 
	COUNT(*)
FROM sportGroups;

SELECT 
	group_id as GroupId,
    SUM(paymentAmount) as payment
FROM taxesPayments
GROUP BY group_id
HAVING payment > 11000;

CREATE VIEW sprotPlace
	AS
SELECT
	s.name AS Sport,
    sg.location  AS Place
FROM sports as s
JOIN sportGroups as sg
	ON s.id = sg.sport_id;
    
SELECT * FROM school_sport_clubs.sprotplace;

#EXERCISE 4

SELECT * FROM student_sport;

SELECT 
	*
FROM students as firstStud
JOIN sports
ON ( #returns if student is related to a sport
	firstStud.id IN ( #returns ids of students that are realted to a group
		SELECT 
			student_id
		FROM student_sport
        WHERE sportGroup_id IN ( #returns ids 1, 2, 3, 4, 6 - only groups that are related to sport
			SELECT 
				id
			FROM sportGroups
            WHERE sportGroups.sport_id = sports.id
        )
    )
);

SELECT 
	firstStud.name as Student1,
    secondStud.name as Student2,
    sports.name as Sport
FROM students as firstStud
JOIN students as secondStud
ON firstStud.id > secondStud.id
JOIN sports
ON ( #returns if student is related to a sport
	firstStud.id IN ( #returns ids of students that are realted to a group
		SELECT 
			student_id
		FROM student_sport
        WHERE sportGroup_id IN ( #returns ids 1, 2, 3, 4, 6 - only groups that are related to sport
			SELECT 
				id
			FROM sportGroups
            WHERE sportGroups.sport_id = sports.id
        )
    )
)
AND(
	secondStud.id IN (
		SELECT 
			student_id
        from student_sport
        WHERE sportGroup_id IN (
			SELECT id
            FROM sportGroups
            WHERE sportGroups.sport_id=sports.id
        )
    )
)
WHERE firstStud.id IN (
	SELECT 
		student_id
    FROM student_sport
    WHERE sportGroup_id IN (
		SELECT 
			sportGroup_id
		FROM student_sport
        WHERE student_id = secondStud.id
    ) AND sports.name = "Football"
);

#EXERCISE 5
CREATE VIEW sport_info
	AS
SELECT 
	students.name AS Student_Name,
    students.class,
    sportGroups.location,
    coaches.name AS Coach_Name
FROM students
JOIN student_sport
	ON student_sport.student_id = students.id
JOIN sportGroups
	ON sportGroups.id = student_sport.sportGroup_id
JOIN coaches
	ON coaches.id = sportGroups.coach_id
WHERE sportGroups.hourOfTraining = "08:00:00"; 

SELECT * FROM school_sport_clubs.sport_info;

#Exercise 6
SELECT
	sports.name,
	COUNT(students.id) AS Students_Count
FROM sports
JOIN sportGroups
	ON sportGroups.sport_id = sports.id
JOIN student_sport
	ON student_sport.sportGroup_id = sportGroups.id
JOIN students
	ON students.id = student_sport.student_id
GROUP BY sports.id;

#Exercise 2
CREATE DATABASE Cinemas;

CREATE TABLE Cinemas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(20) NOT NULL
);

CREATE TABLE Status (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Halls (
	id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(5) NOT NULL UNIQUE,
	cinema_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (cinema_id) REFERENCES Cinemas(id),
    status_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (status_id) REFERENCES Status(id)
);

CREATE TABLE Movies (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    duration TIME NOT NULL,
    year INT NOT NULL,
	country VARCHAR(50) NOT NULL
);

CREATE TABLE Projections (
	id INT AUTO_INCREMENT PRIMARY KEY,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    ticket_count INT,
    max_capcity INT NOT NULL,
    movie_id INT NOT NUll,
    CONSTRAINT FOREIGN KEY (movie_id) REFERENCES Movies(id),
	hall_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (hall_id) REFERENCES Halls(id)
);

CREATE TABLE Viewers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE TICKETS (
	id INT AUTO_INCREMENT PRIMARY KEY,
    projection_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (projection_id) REFERENCES Projections(id),
    viewer_id INT NOT NULL,
    CONSTRAINT FOREIGN KEY (viewer_id) REFERENCES Viewers(id)
);

USE CINEMAS;

SELECT
	Cinemas.name AS Cinema,
    Halls.number AS Hall_Number,
    Projections.start_time AS Start_of_Projection
FROM Cinemas
JOIN Halls
	ON Halls.cinema_id = Cinemas.id
JOIN Projections
	ON Projections.hall_id = Hall.id
JOIN Movies
	ON Movies.id = Projections.movie_id
JOIN Status
	ON Status.id = Halls.status_id
WHERE Movies = "Final Destination 7" AND Status.name IN ("VIP", "Deluxe")
ORDER BY Cinemas.name, Halls.number ASC;

SELECT 
	COUNT(*)
FROM Viewers
JOIN TICKETS
	ON Tickets.viewer_id = Viewer.id
JOIN Projections
	ON Projections.id = Tickets.projection_id
JOIN Movies
	ON Movies.id = Projections.movie_id
JOIN Cinemas 
	ON Cinemas.id = Projections.cinema_id
JOIN Halls 
	ON Halls.cinema_id = Cinemas.id
JOIN Status
	ON Status.id = Halls.status_id
WHERE Cinemas.name = "Arena Mladost" AND Status.name = "VIP" AND movie.name = "Final Destination 7";
	






