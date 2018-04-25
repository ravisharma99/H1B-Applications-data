h1b = load '/home/hduser/Downloads/h1b/' using PigStorage('\t') as (sno, status, ename, socName, des: chararray, fullTime, wage, year, worksite,lon, lat);

h1b = foreach h1b generate LOWER($4) as des, TRIM($7) as year;

a = filter h1b by year == '2011';

ag = group a by des;

a1 = foreach ag generate group, COUNT(a);

b = filter h1b by year == '2012';

bg = group b by des;

b1 = foreach bg generate group, COUNT(b);

c = filter h1b by year == '2013';

cg = group c by des;

c1 = foreach cg generate group, COUNT(c);

d = filter h1b by year == '2014';

dg = group d by des;

d1 = foreach dg generate group, COUNT(d);

e = filter h1b by year == '2015';

eg = group e by des;

e1 = foreach eg generate group, COUNT(e);

f = filter h1b by year == '2016';

fg = group f by des;

f1 = foreach fg generate group, COUNT(f);

g = join a1 by $0, b1 by $0, c1 by $0, d1 by $0, e1 by $0, f1 by $0;

g = foreach g generate $0, $1, $3, $5, $7, $9, $11;

g = foreach g generate $0, ($2 - $1)/$1, ($3 - $2)/$2, ($4 - $3)/$3, ($5 - $4)/$4, ($6 - $5)/$5;

g = foreach g generate $0, ($1 + $2 + $3 +  $4 + $5)/5;

g = order g by $1 desc;

g = limit g 5; 

store g  into  '/home/hduser/Documents/h1boutput/1b';
