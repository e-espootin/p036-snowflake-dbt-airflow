with base as (
    select * from {{ ref('raw_listings_seattle') }}  -- Reference the staging model
    union all
    select * from {{ ref('raw_listings_boston') }} 
),

cleaned_data as (
    select *
    from base as a
   
)

select * from cleaned_data