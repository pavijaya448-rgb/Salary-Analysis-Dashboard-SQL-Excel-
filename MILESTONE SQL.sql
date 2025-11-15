CREATE DATABASE SALARY_SURVEY;
USE SALARY_SURVEY;

/* IMPORTED FILE USING MYSQL WORKBENCH IMPORTED TOOLS */
SELECT * FROM Salary_Survey_Cleaned;

/* 1. Average Salary by Industry and Gender */
SELECT Industry, Gender, ROUND(AVG(AnnualUSDSalary), 2) AS AVERAGE_SALARY
FROM Salary_Survey_Cleaned
GROUP BY Industry, Gender
ORDER BY Industry, Gender;

/* 2. Total Salary Compensation by Job Title */
SELECT JobTitle, ROUND(SUM(AnnualUSDSalary + AdditionalMonetaryCompensation), 2) AS TOTAL_COMPENSATION
FROM Salary_Survey_Cleaned
GROUP BY JobTitle
ORDER BY TOTAL_COMPENSATION DESC;

/* 3. Salary Distribution by Education Level */
SELECT HighestLevelOfEducationCompleted AS EDUCATION_LEVEL,
ROUND(AVG(AnnualUSDSalary), 2) AS AVERAGE_SALARY,
ROUND(MIN(AnnualUSDSalary), 2) AS MINIMUM_SALARY,
ROUND(MAX(AnnualUSDSalary), 2) AS MAXIMUM_SALARY
FROM Salary_Survey_Cleaned
GROUP BY HighestLevelOfEducationCompleted
ORDER BY AVERAGE_SALARY DESC;

/* 4. Number of Employees by Industry and Years of Experience */
SELECT Industry, YearsOfProfessionalExperienceOverall AS OVERALL_EXPERIENCE,
COUNT(*) AS EMPLOYEE_COUNT
FROM Salary_Survey_Cleaned
GROUP BY YearsOfProfessionalExperienceOverall, Industry
ORDER BY Industry, OVERALL_EXPERIENCE;

/* 5. Median Salary by Age Range and Gender */
SELECT AgeRange, Gender, ROUND(AVG(AnnualUSDSalary), 2) AS APPROX_MEDIAN_SALARY
FROM Salary_Survey_Cleaned
GROUP BY AgeRange, Gender
ORDER BY AgeRange, Gender;

/* 6. Job Titles with the Highest Salary in Each Country */
SELECT JobTitle, Country, AnnualUSDSalary AS HIGHEST_SALARY
FROM Salary_Survey_Cleaned
WHERE (Country, AnnualUSDSalary) IN (
SELECT Country, ROUND(MAX(AnnualUSDSalary),2)
FROM Salary_Survey_Cleaned
GROUP BY Country)
ORDER BY Country, HIGHEST_SALARY DESC;

/* 7. Average Salary by City and Industry */
SELECT City,Industry, ROUND(AVG(AnnualUSDSalary),2) AS AVG_SALARY
FROM Salary_Survey_Cleaned
GROUP BY City, Industry
ORDER BY City, AVG_SALARY DESC;

/* 8. Percentage of Employees with Additional Monetary Compensation by Gender */
SELECT Gender, 
ROUND(SUM(IF(AdditionalMonetaryCompensation>0, 1, 0)*100.0)/COUNT(*),2) AS BONUS_PERCENT
FROM Salary_Survey_Cleaned
GROUP BY Gender;

/* 9. Total Compensation by Job Title and Years of Experience */
SELECT JobTitle, YearsOfProfessionalExperienceOverall AS EXPERIENCE_LEVEL,
ROUND(SUM(AnnualUSDSalary + AdditionalMonetaryCompensation),2) AS TOTAL_MONETARY
FROM Salary_Survey_Cleaned
GROUP BY JobTitle, YearsOfProfessionalExperienceOverall
ORDER BY JobTitle, EXPERIENCE_LEVEL;

/* 10. Average Salary by Industry, Gender, and Education Level */
SELECT Industry, Gender, 
HighestLevelOfEducationCompleted AS EDUCATION_LEVEL,
ROUND(AVG(AnnualUSDSalary),2) AS AVERAGE_SALARY
FROM Salary_Survey_Cleaned
GROUP BY Industry, Gender, HighestLevelOfEducationCompleted
ORDER BY Industry, Gender, EDUCATION_LEVEL;














