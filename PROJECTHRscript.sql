Use projecthr;
SELECT * FROM projecthr.absenteeism;
SELECT * FROM projecthr.reasons;
CREATE VIEW main_table_absenteeism AS 
SELECT * FROM projecthr.absenteeism;
DESCRIBE projecthr.absenteeism;

-- 1. CREATE A JOIN TABLE
SELECT * 
FROM projecthr.absenteeism AS Ab
LEFT JOIN projecthr.compensation AS Com ON Ab.ID = Com.ID
LEFT JOIN projecthr.reasons AS Rs ON Ab.`Reason for absence` = Rs.Number;

-- 2. PRINT OUT THE 25 HEALTHIEST PEOPLE TO RECEIVE THE 10000 DOLLAR INCENTIVE
CREATE VIEW HEALTHIEST AS 
SELECT ID,Age,`Social drinker`,`Social smoker`,`Body mass index` 
FROM projecthr.absenteeism
WHERE `Social drinker`= 0 AND `Social smoker` = 0
AND `Body mass index` < 25 AND
`Absenteeism time in hours` < ( SELECT AVG(`Absenteeism time in hours`)
FROM projecthr.absenteeism) limit 25;



SELECT COUNT(*) AS TOTALNONSMOKERS FROM projecthr.absenteeism
WHERE `Social smoker`= 0 ;

-- Categorize by Seasons and BMI 
CREATE VIEW  SEASONSANDBMI AS 
SELECT Ab.ID,Rs.Reason,
CASE
WHEN 'Body mass index' <18.5 THEN 'Underweight'
WHEN 'Body mass index' between 18.5 AND 25 THEN 'Healthy'
WHEN 'Body mass index' between 25   AND 30 THEN 'Overweight'
WHEN 'Body mass index' >18.5               THEN 'Else'
ELSE 'Unknown' END AS BMI_CATEGORY, 

CASE
WHEN `month of absence` IN (12,1,2) THEN 'Winter'
WHEN `month of absence` IN (3,4,5) THEN 'Spring'
WHEN `month of absence` IN (6,7,8) THEN 'Summer'
WHEN `Month of absence` IN (9,10,11) THEN 'Fall'
ELSE 'Unknown' END AS Season
FROM projecthr.absenteeism AS Ab
LEFT JOIN projecthr.compensation AS Com ON Ab.ID = Com.ID
LEFT JOIN projecthr.reasons AS Rs ON Ab.`Reason for absence` = Rs.Number;

-- FOR POWER bi
SELECT Ab.ID,Rs.Reason,
CASE
WHEN `Body mass index` <18.5 THEN 'Underweight'
WHEN `Body mass index` BETWEEN 18.5 AND 25 THEN 'Healthy'
WHEN `Body mass index` between 25  AND 30 THEN 'Overweight'
WHEN `Body mass index` >30  THEN 'Obese'
ELSE 'Unknown' END AS BMI_CATEGORY ,

CASE
WHEN `month of absence` IN (12,1,2) THEN 'Winter'
WHEN `month of absence` IN (3,4,5) THEN 'Spring'
WHEN `month of absence` IN (6,7,8) THEN 'Summer'
WHEN `Month of absence` IN (9,10,11) THEN 'Fall'
ELSE 'Unknown' END AS Season,
`Month of absence`,
`Day of the week`,
`Transportation expense`,
`Service time`,
`Age`,
`Work load Average/day`,
`Hit target`,
`Disciplinary failure`,
`Education`,
`Son`,
`Social drinker`,
`social smoker`,
`Pet`,
`Weight`,
`Height`,
`Body mass index`,
`Absenteeism time in hours`
FROM projecthr.absenteeism AS Ab
LEFT JOIN projecthr.compensation AS Com ON Ab.ID = Com.ID
LEFT JOIN projecthr.reasons AS Rs ON Ab.`Reason for absence` = Rs.Number;

CREATE VIEW BMI AS 
SELECT Ab.ID,Rs.Reason,`Body mass index`,
CASE
WHEN `Body mass index` <18.5 THEN 'Underweight'
WHEN `Body mass index` BETWEEN 18.5 AND 25 THEN 'Healthy'
WHEN `Body mass index` between 25  AND 30 THEN 'Overweight'
WHEN `Body mass index` >30  THEN 'Obese'
ELSE 'Unknown' END AS BMI_CATEGORY 
FROM projecthr.absenteeism AS Ab
LEFT JOIN projecthr.compensation AS Com ON Ab.ID = Com.ID
LEFT JOIN projecthr.reasons AS Rs ON Ab.`Reason for absence` = Rs.Number;




