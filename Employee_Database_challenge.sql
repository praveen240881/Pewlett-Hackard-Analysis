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

--deliverable2


select distinct on (emp.emp_no) emp.emp_no,emp.first_name,emp.last_name,emp.birth_date,demp.from_date,demp.to_date,title.title
into  mentorship_eligibilty
from employees emp
join dept_emp demp
on emp.emp_no=demp.emp_no
join titles title
on emp.emp_no = title.emp_no
where (title.to_date = '9999-01-01')
and (emp.birth_date between '1965-01-01' and '1965-12-31')
order by emp.emp_no,demp.from_date desc;

--retreive the mentorship_eligibilty table
select * from mentorship_eligibilty;


