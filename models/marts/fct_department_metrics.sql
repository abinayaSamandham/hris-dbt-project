with active_employees as (
    select * from {{ ref('dim_employees') }}
    where employee_status = 'active'
)

select 
    tenant_id,
    department_name,
    count(employee_id) as total_active_employees,
    sum(annual_salary) as total_department_payroll
from active_employees
group by 
    tenant_id, 
    department_name