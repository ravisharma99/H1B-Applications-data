h1b = load '/home/hduser/Downloads/h1b/' using PigStorage('\t') as (sno, status, ename, socName, des: chararray, fullTime, wage, year, worksite,lon, lat);

h1b = foreach h1b generate LOWER($4) as des, $7;

h1b_grouped = group h1b by des;

h1b_summed = foreach h1b_grouped generate group, COUNT(h1b);

store h1b_summed into '/home/hduser/Documents/11/';
