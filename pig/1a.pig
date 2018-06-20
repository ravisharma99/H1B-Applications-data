h1b = load '/home/hduser/Downloads/h1b/' using PigStorage('\t') as (sno, status, ename, socName, des: chararray, fullTime, wage, year, worksite,lon, lat);

h1b = foreach h1b generate LOWER($4) as des, $7;

de = filter h1b by des matches '.*data engineer.*';

de_grouped = group de by year;

de_s = foreach de_grouped generate group as year, COUNT(de.des) as n;

de_s1 = foreach de_s generate year, n;

a = join de_s by $0, de_s1 by ($0-1);

a = foreach a generate ($3 - $1) as dif;

b = group a all;

b = foreach b generate AVG(a.dif) as avg_diff;


b = foreach b generate case when avg_diff > 0 then '*******************************************************************************\nThe number of petitions with Data Engineer job title is increasing over time.\n*******************************************************************************' else 'The number of petitions with Data Engineer job title is not increasing over time.' end;

store b  into  '/home/hduser/Documents/h1boutput/1a';
