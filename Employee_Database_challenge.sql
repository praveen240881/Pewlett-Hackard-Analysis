-- create the retirement title tables
select em.emp_no,
em.first_name,
em.last_name,
ti.title,
ti.from_date,
ti.to_date
into retirement_titles
from employees as em
inner join titles as ti
on em.emp_no=ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') order by em.emp_no asc;
--retrieve the file from  retirement tables
select distinct on(emp_no)emp_no,first_name,last_name,title,from_date,to_date from retirement_titles;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
title,
first_name,
last_name
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no DESC;
--retrieve the column from unique_table
select * from unique_titles;
--create the unique_titles table
select distinct on(emp_no)emp_no,
first_name,
last_name,
title
INTO unique_titles
from retirement_titles
order by emp_no ASC,to_date desc;
--retreive the records from retirement_title table
select * from unique_titles;
--create the retiring_title  table
select count(title),title
into retiring_titles
from unique_titles
group by title
order by count(title)  desc;

---retrieve the retiring_title table
select * from retiring_titles;
