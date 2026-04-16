with employees as (
    select * from {{ ref('stg_employees') }}
),

departments as (
    select * from {{ ref('stg_departments') }}
),

salaries as (
    select * from {{ ref('stg_salaries') }}
),

tenure as (
    select * from {{ ref('int_employee_tenure_calc') }}
),

final_join as (
    select
        e.tenant_id,
        e.employee_id,
        e.full_name,
        e.employee_status,
        e.hire_date,
        d.department_name,
        s.annual_salary as salary_local,
        -- Using our macro here
        {{ convert_to_usd('s.annual_salary', 0.8) }} as salary_usd,
        t.tenure_months
    from employees e
    left join departments d 
        on e.tenant_id = d.tenant_id 
        and e.department_id = d.department_id
    left join salaries s 
        on e.tenant_id = s.tenant_id 
        and e.employee_id = s.employee_id
    left join tenure t
        on e.tenant_id = t.tenant_id
        and e.employee_id = t.employee_id
)

select * from final_join