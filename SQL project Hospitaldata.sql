CREATE DATABASE Hospital ;
use Hospital;

CREATE TABLE Hospital_data (
    Hospital_Name VARCHAR(100),
    Location VARCHAR(100),
    Department VARCHAR(100),
    Doctors_Count INT,
    Patients_Count INT,
    Admission_Date DATE,
    Discharge_Date DATE,
    Medical_Expenses numeric (10, 2)
);


SELECT * FROM Hospital_data; 


-- 1. total number of patients
SELECT sum(Patients_Count) 
FROM Hospital_data; 


-- 2. Average Number of Doctors per Hospital
SELECT Hospital_Name, AVG( Doctors_Count) AS avg_count
FROM hospital_data
GROUP BY Hospital_Name;



-- 3. Top 3 Departments with the Highest Number of Patients
SELECT Department, SUM(Patients_Count) FROM hospital_data
GROUP BY Department
ORDER BY SUM(Patients_Count) DESC 
LIMIT 3;


-- 4. Hospital with the Maximum Medical Expenses
SELECT Hospital_Name, SUM(Medical_Expenses) 
FROM hospital_data
GROUP BY Hospital_Name 
ORDER BY SUM(Medical_Expenses) DESC LIMIT 1;



-- 5. Daily Average Medical Expenses
SELECT Hospital_Name, AVG(Medical_Expenses/ (Discharge_Date - Admission_Date) ) AS Daily_Expenses
FROM hospital_data
GROUP BY Hospital_Name;


-- 6. Longest Hospital Stay
SELECT Hospital_name, Location, (Discharge_Date - Admission_Date) AS Longest_Stay
FROM hospital_data
ORDER BY Longest_Stay DESC LIMIT 1;


-- 7. Total Patients Treated Per City
SELECT Location, SUM(Patients_Count) AS Total_Patients
FROM hospital_data
GROUP BY Location
ORDER BY Total_Patients DESC;


-- 8. Average Length of Stay Per Department
SELECT Department, AVG(Discharge_Date - Admission_Date) AS AVG_LEN
FROM Hospital_data
GROUP BY Department;



-- 9. Identify the Department with the Lowest Number of Patients
SELECT Department, SUM(Patients_Count) AS Lowest_Num
FROM Hospital_data
GROUP BY Department
ORDER BY Lowest_Num LIMIT 1;


-- 10. Monthly Medical Expenses Report
SELECT EXTRACT(MONTH FROM Discharge_Date) AS MONTH, 
SUM(Medical_Expenses) FROM Hospital_data
GROUP BY MONTH; 