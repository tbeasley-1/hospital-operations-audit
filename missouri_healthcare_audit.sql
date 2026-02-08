-- PROBLEM 1: High-Volume State Quality Audit
-- Finds states with >100 hospitals and ranks by average rating
SELECT facility_state, COUNT(facility_state), ROUND(AVG(rating_overall), 2) AS average_rating
FROM hospitals
WHERE rating_overall > 0
GROUP BY facility_state
HAVING count(facility_state) > 100
ORDER BY average_rating DESC;

-- PROBLEM 2: Missouri Pneumonia Cost Variability
-- Analyzes the statistical spread of procedure costs in MO
SELECT facility_state, MIN(procedure_pneumonia_cost) AS minimum_pneumonia_procedure_cost, 
	MAX(procedure_pneumonia_cost) AS maximum_pneumonia_procedure_cost, 
	ROUND(AVG(procedure_pneumonia_cost), 2) AS average_pneumonia_procedure_cost
FROM hospitals
WHERE facility_state = 'MO'
	AND procedure_pneumonia_cost > 0
GROUP BY facility_state;

-- PROBLEM 3: Missouri City Efficiency Leaderboard
-- Ranks MO cities by average quality rating
SELECT facility_city, COUNT(facility_city) AS number_of_facilities, 
	ROUND(AVG(rating_overall), 2) AS average_rating
FROM hospitals
WHERE facility_state = 'MO'
GROUP BY facility_city
HAVING ROUND(AVG(rating_overall), 2) > 0
ORDER BY average_rating DESC;