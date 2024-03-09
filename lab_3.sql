USE school_sport_clubs;

SELECT 
	sports.name,
    sportGroups.location
FROM sports 
RIGHT JOIN sportGroups
ON sports.id = sportGroups.sport_id
WHERE sports.id is null;

SELECT
	sports.name,
    coaches.name
FROM sports
JOIN coaches
ON sports.id 
IN (
	SELECT sport_id
    from sportGroups
    WHERE sportGroups.coach_id = coaches.id
);