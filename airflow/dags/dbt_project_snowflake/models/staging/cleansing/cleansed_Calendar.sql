with base as (
    select * from {{ ref('raw_Calendar_seattle') }}  -- Reference the staging model
    union all
    select * from {{ ref('raw_Calendar_boston') }}  -- Reference the staging model
),

cleaned_data as (
    select *
    from base as a
    where a.AVAILABLE is not null
        and a.Date between '2005-01-01' and '2025-01-01'
        and a.price is not null
        
)

select * from cleaned_data

