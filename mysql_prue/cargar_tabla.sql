LOAD DATA LOCAL INFILE 'CSVs/yellow_tripdata_2017-06.csv'
INTO TABLE taxis2017
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;