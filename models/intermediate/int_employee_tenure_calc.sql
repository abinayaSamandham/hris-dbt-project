with employees as (
    select * from {{ ref('stg_employees') }}
)

select
    tenant_id,
    employee_id,
    -- Business Logic: Calculate months between hire and today
    -- (Assuming a hire_date column exists in your staging)
    datediff('month', hire_date, current_date()) as tenure_months
from employees