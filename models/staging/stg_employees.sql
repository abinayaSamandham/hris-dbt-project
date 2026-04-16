with source as (
    select * from {{ source('hr_system', 'employees') }}
),

renamed_and_cleaned as (
    select
        tenant_id,
        emp_id as employee_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as full_name,
        department_id,
        hire_date,  -- <--- ADD THIS LINE
        lower(status) as employee_status
    from source
)

select * from renamed_and_cleaned