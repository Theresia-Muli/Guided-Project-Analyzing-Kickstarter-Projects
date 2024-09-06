--Retrieve Column Data Types
PRAGMA table_info(ksprojects)

--Pull the relevant columns from the ksprojects table to will allow us to assess a project's result based on its main category, amount of money set as a goal, number of backers, and amount of money pledged. 

SELECT ID, name, category, main_category, goal, pledged, state, backers
FROM ksprojects
LIMIT 10;


--Filtering by Category (where the project state is either 'failed', 'canceled', or 'suspended')

SELECT main_category, goal, backers, pledged
  FROM ksprojects
  WHERE state IN ('failed', 'canceled', 'suspended')
 LIMIT 10;


--Filtering by Quantity (the projects that had at least 100 backers and at least $20,000 pledged.)

SELECT main_category, backers, pledged, goal
 FROM ksprojects
WHERE state IN ('failed', 'canceled', 'suspended') AND backers > 99 AND pledged > 19999
LIMIT 10;


--Ordering Results in descending order. Sorting main category in ascending order.


SELECT main_category, backers, pledged, goal, pledged/goal AS pct_pledged
  FROM ksprojects
 WHERE state IN ('failed')
   AND backers >= 100 AND pledged >= 20000 
ORDER BY main_category, pct_pledged DESC
 LIMIT 10;

--Applying Conditional Logic.

  SELECT main_category, backers, pledged, goal,
         pledged/goal AS pct_pledged,
  CASE 
    WHEN pledged/goal >= 1 THEN "Fully funded"
    WHEN pledged/goal BETWEEN 0.75 AND 1 THEN "Nearly funded"
   ELSE "Not nearly funded"
  END AS funding_status
    FROM ksprojects
   WHERE state IN ('failed')
     AND backers >= 100 AND pledged >= 20000
ORDER BY main_category, pct_pledged DESC
   LIMIT 10;


