with active_employees as (
    select * from {{ ref('dim_employees') }}
    where employee_status = 'active'
)

select 
    tenant_id,
    department_name,
    count(employee_id) as total_active_employees,
    -- Update this line to use the new name 'salary_local'
    sum(salary_local) as total_department_payroll,
    -- Optional: Add a total in USD as well!
    sum(salary_usd) as total_department_payroll_usd
from active_employees
group by 
    tenant_id, 
    department_name