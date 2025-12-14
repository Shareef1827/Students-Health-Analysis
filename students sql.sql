CREATE DATABASE STUDENTS_HEALTH;

USE STUDENTS_HEALTH;

SELECT * FROM HEALTH;
DESC HEALTH;

-- Which students show high depression scores?
SELECT *
FROM HEALTH
WHERE DEPRESSION=1;

-- How many students experienced suicidal thoughts?
SELECT COUNT(id) AS COUNT_OF_SUICIDAL_THOUGHTS
FROM HEALTH
WHERE `have_you_ever_had_suicidal_thoughts_?`='Yes';
-- if the column name contain any special character then we use ` symbol to declare column name

-- How many students are diagnosed with depression?
SELECT COUNT(*) AS DEPRESSION_STUDENTS
FROM HEALTH
WHERE DEPRESSION=1;
-- What percentage of students have experienced suicidal thoughts?
SELECT (COUNT(*)/(SELECT COUNT(*) FROM HEALTH))*100 AS PERCENTAGE
FROM HEALTH
WHERE `have_you_ever_had_suicidal_thoughts_?`='Yes';

-- Which students have both depression and suicidal thoughts?
SELECT COUNT(*) AS TOTAL
FROM HEALTH
WHERE `have_you_ever_had_suicidal_thoughts_?`='Yes' AND DEPRESSION=1;

-- Is depression more common among students with a family history of mental illness?
SELECT
family_history_of_mental_illness,
COUNT(*) AS COUNT,
SUM(DEPRESSION) AS DEPRESSED_STUDENTS,
AVG(DEPRESSION) AS AVERATE_STUDENTS
FROM HEALTH
GROUP BY FAMILY_HISTORY_OF_MENTAL_ILLNESS;

-- Which age group shows the highest depression rate?
SELECT 
CASE
	WHEN AGE <= 18 THEN 'BELOW 18'
    WHEN AGE >18 AND AGE <=22 THEN '18-22'
    WHEN AGE >22 AND AGE<= 30 THEN '22-30'
    ELSE '30+'
END AS AGE_GROUP,
COUNT(*) AS NO_OF_STUDENTS,
AVG(DEPRESSION) AS DEPRESSION_RATE
FROM HEALTH
GROUP BY AGE_GROUP
ORDER BY DEPRESSION_RATE DESC;

-- Does higher academic pressure lead to increased depression levels?
SELECT 
ACADEMIC_PRESSURE,
COUNT(*) AS TOTAL_STUDENTS,
AVG(depression) AS DEPRESSION_RATE
FROM HEALTH
GROUP BY ACADEMIC_PRESSURE
ORDER BY ACADEMIC_PRESSURE;

-- Which degree programs report the highest average academic pressure?
SELECT DEGREE,
AVG(ACADEMIC_PRESSURE) AS AVG_ACADEMIC_PRESSURE
FROM HEALTH
GROUP BY DEGREE
ORDER BY AVG_ACADEMIC_PRESSURE DESC;

-- How do work/study hours affect depression levels?
SELECT `WORK/STUDY_HOURS`,
COUNT(*) AS NO_STUDENTS,
AVG(DEPRESSION) AS DEPRESSION_LEVEL
FROM HEALTH
GROUP BY `WORK/STUDY_HOURS`
ORDER BY DEPRESSION_LEVEL DESC;

-- Is job satisfaction lower among students with high work pressure?
SELECT 
WORK_PRESSURE,
AVG(JOB_SATISFACTION) AS AVG_JOB_SATISFACTION
FROM HEALTH
GROUP BY WORK_PRESSURE
ORDER BY WORK_PRESSURE;

-- Which profession category shows the highest depression rate?
SELECT 
PROFESSION,
COUNT(*) AS TOTAL_STUDENTS,
SUM(DEPRESSION) AS DEPRESSION_RATE
FROM HEALTH
GROUP BY PROFESSION
ORDER BY DEPRESSION_RATE DESC;

-- How does sleep duration impact depression levels?
SELECT 
SLEEP_DURATION,
COUNT(*) TOTAL_STUDENTS,
SUM(DEPRESSION) AS DEPRESSION_LEVEL
FROM HEALTH
GROUP BY SLEEP_DURATION
ORDER BY DEPRESSION_LEVEL DESC;

-- Do students with unhealthy dietary habits show higher depression rates?
SELECT 
DIETARY_HABITS,
AVG(DEPRESSION) AS DEPRESSION_RATE
FROM HEALTH
GROUP BY DIETARY_HABITS
ORDER BY DEPRESSION_RATE DESC;

-- Which sleep duration category has the most depressed students?
SELECT
SLEEP_DURATION,
COUNT(*) TOTAL_STUDENTS
FROM HEALTH
WHERE DEPRESSION=1
GROUP BY SLEEP_DURATION
ORDER BY TOTAL_STUDENTS DESC LIMIT 1;

-- Is there a relationship between dietary habits and academic pressure?
SELECT 
DIETARY_HABITS,
    COUNT(*) AS TOTAL_STUDENTS,
    AVG(academic_pressure) AS AVG_ACADEMIC_PRESSURE
FROM HEALTH
GROUP BY DIETARY_HABITS
ORDER BY AVG_ACADEMIC_PRESSURE DESC;
