use h1b;


"select worksite, count(*) as n from h1b.h1b_final where lower(job_title) like '%data engineer%' and trim(year)= '$year' group by worksite order by n desc limit 5";
