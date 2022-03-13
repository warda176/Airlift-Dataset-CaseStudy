--First i transform the original dataset by performing below query.
SELECT warehouse
	, total_orders
	, DATE
	, EXTRACT(MONTH FROM DATE) AS Month
	, EXTRACT(DAYOFWEEK FROM DATE) AS Day
	, CASE WHEN DATE BETWEEN '2021-08-01'
				AND '2021-08-15' THEN '1st half- aug' WHEN DATE BETWEEN '2021-08-16'
				AND '2021-08-31' THEN '2nd-half-aug' WHEN DATE BETWEEN '2021-09-01'
				AND '2021-09-15' THEN '1st half- sep' WHEN DATE BETWEEN '2021-09-16'
				AND '2021-09-30' THEN '2nd-half-sep' WHEN DATE BETWEEN '2021-10-01'
				AND '2021-10-15' THEN '1st half- oct' WHEN DATE BETWEEN '2021-10-16'
				AND '2021-10-31' THEN '2nd-half-oct' WHEN DATE BETWEEN '2021-11-01'
				AND '2021-11-15' THEN '1st half-nov' WHEN DATE BETWEEN '2021-11-16'
				AND '2021-11-30' THEN '2nd-half-nov' END AS PartOfMonth
	,
FROM `my - data - project1 - 330110. airlift.casestudy`;

--Then i queried the results i got from the above query and transforme it further.
SELECT *
	, CASE WHEN Day = 1 THEN 'Sunday-Weekend' 
         WHEN Day = 2 THEN 'Monday-Weekday' 
         WHEN Day = 3 THEN 'Tuesday-Weekday' 
         WHEN Day = 4 THEN 'Wednesday-Weekday' 
         WHEN Day = 5 THEN 'Thursday-Weekday' 
         WHEN Day = 6 THEN 'Friday-Weekday' 
         WHEN Day = 7 THEN 'Saturday-Weekend' 
         ELSE 'No-DAY' END AS DayName
	, 
  
  CASE 
  WHEN Month = 8 THEN 'august' 
  WHEN Month = 9 THEN 'september' 
  WHEN Month = 10 THEN 'october' 
  ELSE 'november' END AS MonthName
  FROM `my - data - project1 - 330110. airlift.transformed_dataset`
ORDER BY DATE ASC
