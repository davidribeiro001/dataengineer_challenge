--SQL QUERY TO CALCULATE THE AVG DISTANCE PER REGION  PER WEEK
WITH WEEKAVG as (
--CTE to determine the AVG of trips per week by region
SELECT region , ROUND(AVG(CAST(contador AS FLOAT)), 2) AS AVGTRIPSPERWEEK
FROM (
		SELECT region , count(1) as contador
		FROM [Challenge].[dbo].[File3]
		GROUP BY region , DATENAME(ww,[datetime])) AS sub1
GROUP BY region
) 
SELECT p.[REGION]
      ,[ORIGIN_COORD]
      ,[DESTINATION_COORD]
      ,[DATETIME]
      ,[DATASOURCE]
      ,cast([Distance] as decimal (18,2 ) ) as DISTANCE
	  --Defining a distance range to group and order information:
	  ,CASE 
			when  cast([Distance] as decimal (18,2 ) )  between 0 and 5       then 1
			when  cast([Distance] as decimal (18,2 ) )  between 5.01 and 10   then 2
			when  cast([Distance] as decimal (18,2 ) )  between 10.01 and 15  then 3
			when  cast([Distance] as decimal (18,2 ) )  between 15.01 and 20  then 4
			when  cast([Distance] as decimal (18,2 ) )  between 20.01 and 100 then 4
	   ELSE 0 end as RANGEID
      ,DATENAME(ww,[datetime]) as WEEKNUMBER 
	  ,WEEKAVG.AVGTRIPSPERWEEK
FROM [Challenge].[dbo].[File3] P
inner join  WEEKAVG on p.region = WEEKAVG.region
GROUP BY p.region , [origin_coord] , [destination_coord],[datetime],[datasource],Distance ,AVGTRIPSPERWEEK
ORDER BY p.region, distance , datetime asc ,RangeId