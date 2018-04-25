h1b = load '/home/hduser/Downloads/h1b/' using PigStorage('\t') as (sno, status, ename, socName, des: chararray, fullTime, wage, year: chararray, worksite,lon, lat);

h1b = foreach h1b generate LOWER($4) as des, $7;

h1b = filter h1b by (TRIM(year) == '$year');

h1b_grouped = group h1b by des;

h1b_summed = foreach h1b_grouped generate group as des, COUNT(h1b) as n;

h1b = order h1b_summed by n desc;

h1b = limit h1b 10;

dump h1b;
