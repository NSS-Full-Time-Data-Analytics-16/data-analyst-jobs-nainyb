--How many rows are in the data_analyst_jobs table? 1793 rows

SELECT * 
FROM data_analyst_jobs;

--2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
--"XTO Land Data Analyst" ---Company name "ExxonMobil"

SELECT * 
FROM data_analyst_jobs
LIMIT 10;

--3..	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
 
SELECT count(title)
FROM data_analyst_jobs
WHERE location like  'TN' OR location like ' KY';
--TN_ 21 posting

--4How many postings in Tennessee have a star rating above 4?
SELECT * 
FROM data_analyst_jobs
WHERE star_rating >4 AND Location like 'TN';

--	5. How many postings in the dataset have a review count between 500 and 1000? --151
SELECT count(* )
FROM data_analyst_jobs
WHERE review_count  Between 500 and 1000 ;

---6.	Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`.
--- Which state shows the highest average rating?

SEL

SELECT Round(AVG(star_rating),2)as Avg_rating , location as state
FROM data_analyst_jobs
Group BY location 
ORDER BY Avg_rating desc

---7 .Select unique job titles from the data_analyst_jobs table. How many are there? 881

SELECT count(DISTINCT(title))
FROM data_analyst_jobs
--8.	How many unique job titles are there for California companies? 230
SELECT count(DISTINCT(title))
FROM data_analyst_jobs
WHERE location Ilike 'CA'

---9.Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations?


















