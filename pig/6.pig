h1b = load '/home/hduser/Downloads/h1b/' using PigStorage('\t') as (sno, status, ename, socName, des: chararray, fullTime, wage, year, worksite,lon, lat);

h1b = foreach h1b generate LOWER($1) as status, $7;

grouped = group h1b by year;

a = foreach grouped generate group as year, COUNT(h1b) as total;

b = filter h1b by (status == 'certified');

bgrouped = group b by year;

b = foreach bgrouped generate group as year, COUNT(b) as count;

c = filter h1b by (status == 'withdrawn');

cgrouped = group c by year;

c = foreach cgrouped generate group as year, COUNT(c) as count;

d = filter h1b by (status == 'denied');

dgrouped = group d by year;

d = foreach dgrouped generate group as year, COUNT(d) as count;

e = filter h1b by (status == 'certified-withdrawn');

egrouped = group e by year;

e = foreach egrouped generate group as year, COUNT(e) as count;

f = join b by $0, c by $0, d by $0, e by $0, a by $0;

f = foreach f generate $0, $1, $3, $5, $7, $9;

f = foreach f generate $0, (($1 * 100)/$5), (($2 * 100)/$5), (($3 * 100)/$5), (($4 * 100)/$5);

store f into '/home/hduser/Documents/6/';
