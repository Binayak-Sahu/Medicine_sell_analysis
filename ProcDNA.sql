SELECT *
FROM physician_level_data;

SELECT *
FROM Affiliation;

SELECT *
FROM ZTT;


-- Top 200 Physician

SELECT Physician_Name, SUM(Jan23_F + Feb23_F + Mar23_F + Apr23_F + May23_F + Jun23_F + Jan23_M + Feb23_M + Mar23_M + Apr23_M + Apr23_M + Jun23_M) AS Prescribed
FROM physician_level_data
group by Physician_Name
order by Prescribed desc
Limit 200;

-- The top 200 physicians based on Total_prescribed

CREATE TEMPORARY TABLE Top200Physicians AS
SELECT Physician_Name
FROM physician_level_data
Group BY Physician_Name
ORDER BY SUM(Jan23_F + Feb23_F + Mar23_F + Apr23_F + May23_F + Jun23_F + Jan23_M + Feb23_M + Mar23_M + Apr23_M + Apr23_M + Jun23_M) DESC
LIMIT 200;

-- Count hospitals without any of the top 200 physicians affiliated

SELECT COUNT(*) AS Hospitals_Without_Top200
FROM Affiliation AS A
LEFT JOIN Top200Physicians AS T ON A.Physician_Name = T.Physician_Name
WHERE T.Physician_Name IS NULL;


-- List the top 5 hospitals based on the # Physicians from the following 4 specialties affiliated to them: "Hematology", "Hematology/Oncology", "Oncology Medical" and "Pediatric Hematology Oncology".			

SELECT A.Hospital_Name, COUNT(DISTINCT CASE WHEN P.Specialty IN ('Hematology', 'Hematology/Oncology', 'Oncology Medical', 'Pediatric Hematology Oncology') THEN P.Physician_Name END) AS Num_Physicians
FROM Affiliation AS A
JOIN Physician_Level_Data AS P ON A.Physician_Name = P.Physician_Name
WHERE P.Specialty IN ('Hematology', 'Hematology/Oncology', 'Oncology Medical', 'Pediatric Hematology Oncology')
GROUP BY A.Hospital_Name, A.Hospital_Zip
ORDER BY
 Num_Physicians DESC
LIMIT 5;

-- Finding the sell of Mercapto across different territories

SELECT  SUM(PLD.Jan23_M + PLD.Feb23_M + PLD.Mar23_M + PLD.Apr23_M + PLD.Apr23_M + PLD.Jun23_M) AS M_Prescribed, ZT.Territory
FROM
    Physician_Level_Data AS PLD
JOIN
    Affiliation AS A ON PLD.Physician_Name = A.Physician_Name
JOIN
    ZTT AS ZT ON A.Hospital_Zip = ZT.Zip
GROUP BY ZT.Territory;

-- above the balanced workload index range

SELECT count(*) 
FROM Territory_t
Where work_load_index > 1300;

-- below the balanced workload index range

SELECT count(*) 
FROM Territory_t
Where work_load_index < 700;




