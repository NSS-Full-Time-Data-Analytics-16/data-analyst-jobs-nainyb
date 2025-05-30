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
SELECT count( title  )
FROM data_analyst_jobs
WHERE review_count  Between 500 and 1000 ;

---6.	Show the average star rating for companies in each state. 
--The output should show the state as `state` and the average rating for the state as `avg_rating`.
--- Which state shows the highest average rating?-- NE

SEL

SELECT Round(AVG(star_rating),2)as Avg_rating , location as state
FROM data_analyst_jobs
WHERE star_rating is not null
Group BY location 
ORDER BY Avg_rating desc

---7 .Select unique job titles from the data_analyst_jobs table. How many are there? 881

SELECT count(DISTINCT(title)) as unqiue_job_titles
FROM data_analyst_jobs
--8.	How many unique job titles are there for California companies? 230
SELECT count(DISTINCT(title)) as CA_company
FROM data_analyst_jobs
WHERE location Ilike 'CA';

---9.Find the name of each company and its average star rating
--for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations? --46

SELECT *
FROM data_analyst_jobs

SELECT company, Round(avg(star_rating),2)as AVG_star_rating 
FROM data_analyst_jobs
where review_count > 5000
group by company

---- SHOULD WE do count with company -- total are 46?

--10.	Add the code to order the query in #9 from highest to lowest average star rating. 
---Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? 
---What is that rating?
SELECT company, round(avg(star_rating) ,2)as AVG_star_rating
FROM data_analyst_jobs
where review_count > 5000
AND company IS NOT NULL
group by company
Order by avg(star_rating) DESC;

--11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? --754 count
SELECT *
FROM data_analyst_jobs;

SELECT count( distinct( title))
FROM data_analyst_jobs
WHERE title ilike '%Analyst%';



---12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
--What word do these positions have in common?

SELECt * 
FROM data_analyst_jobs
WHERE title  NOt ILIke '%Analyst%' AND title  NOt ILIke '%Analytics%' ;


---13 **BONUS:**
--You want to understand which jobs requiring SQL are hard to fill.
--Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
 --Disregard any postings where the domain is NULL. 
 --Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
 --Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

 SELECT domain,count(title) as Count_jobs_hard_to_fill
 FROM data_analyst_jobs
 WHERE  skill ilike '%sql%' 
 AND days_since_posting >21
 AND domain IS not null
 Group by domain
 order by count(title) DESC
 LIMIT 4















