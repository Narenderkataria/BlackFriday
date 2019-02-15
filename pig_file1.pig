blackfriday = LOAD '/home/hduser/Desktop/blackfriday.csv' USING PigStorage(',') as 
(user_id:INT,product_id:chararray,gender:chararray,age:chararray,occupation:INT,city_c:chararray,stay_cc:INT,
married:INT,pc1:INT,pc2:INT,pc3:INT,purchase:INT);

-- Query 1 
query1 = group blackfriday BY (age);
query1result = FOREACH query1 generate flatten(group), SUM(blackfriday.purchase) as age_purchase;
orderedquery1 = order query1result by purchase DESC;
STORE orderedquery1  INTO '/home/hduser/pigoutput/pigtask1' USING PigStorage (',');
