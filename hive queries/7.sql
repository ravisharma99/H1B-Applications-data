use h1b;

INSERT OVERWRITE LOCAL DIRECTORY '/home/hduser/Documents/7'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
select year, count(*) as c from h1b_final group by year;
