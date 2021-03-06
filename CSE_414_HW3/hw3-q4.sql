SELECT DISTINCT F2.dest_city AS city
FROM (SELECT DISTINCT F.origin_city, F.dest_city
     FROM Flights F
     WHERE F.origin_city = 'Seattle WA') AS F1
, Flights as F2
WHERE F1.dest_city = F2.origin_city
AND F2.dest_city != 'Seattle WA'
AND F2.dest_city NOT IN (SELECT DISTINCT F.dest_city
                        FROM Flights F
                        WHERE F.origin_city ='Seattle WA')
ORDER BY city;

/* Query returns 256 rows
   Total execution time: 00:00:11.121
   first 20 rows: 
city
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME
*/