use h1b;


read year

hive -e "select worksite, count(*) as n from h1b.h1b_final where lower(case_status) like 'certified' and trim(year)= '$year' group by worksite order by n desc limit 5";
