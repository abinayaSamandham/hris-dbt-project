{% snapshot snp_salaries %}

{{
    config(
      target_database='hris_db',
      target_schema='snapshots',
      unique_key='employee_id',
      strategy='check',
      check_cols=['annual_salary'] 
    )
}}

select 
    tenant_id,
    emp_id as employee_id, 
    annual_salary,
    updated_at
from {{ source('hr_system', 'salaries') }}

{% endsnapshot %}