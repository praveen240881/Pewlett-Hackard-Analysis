
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





