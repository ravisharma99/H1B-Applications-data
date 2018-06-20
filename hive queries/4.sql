use h1b;
"select employer_name as 'Employer', count(s_no) as 'No_Of_Petitions' from h1b.h1b_final group by employer_name order by n desc limit 5";
