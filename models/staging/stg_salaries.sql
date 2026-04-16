with source as (
    select * from {{ source('hr_system', 'salaries') }}
)

select
    tenant_id,
    emp_id as employee_id,
    annual_salary,
    updated_at
from source