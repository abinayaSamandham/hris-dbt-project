with source as (
    select * from {{ source('hr_system', 'departments') }}
)

select
    tenant_id,
    department_id,
    department_name
from source