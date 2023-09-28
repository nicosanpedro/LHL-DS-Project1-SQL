--DATA AUDIT 

--SUMMARY STATISTICS
SELECT 
    AVG(timeonsite) AS average_time_on_site,
    SUM(totaltransactionrevenue) AS total_revenue,
    AVG(totaltransactionrevenue) AS average_transaction_revenue
FROM all_sessions;


--CHECKING FOR NULL VALUES
SELECT 
    COUNT(*) AS null_visitorIDs 
FROM all_sessions 
WHERE visitorID IS NULL;

SELECT 
    COUNT(*) AS null_sessiondates 
FROM all_sessions 
WHERE sessiondate IS NULL;

--MAKE SURE TOTAL REVENUE IS HIGHER THAN SUBTOTAL TO CHECK FOR OUTLIERS
SELECT 
    sessionid, 
    totaltransactionrevenue, 
    productrevenue 
FROM all_sessions 
WHERE totaltransactionrevenue < productrevenue;

--CHECKING FOR DUPLICATE ALL SESSION IDS
SELECT 
    sessionid,
    COUNT(*) AS occurrence_count
FROM all_sessions
GROUP BY sessionid
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;