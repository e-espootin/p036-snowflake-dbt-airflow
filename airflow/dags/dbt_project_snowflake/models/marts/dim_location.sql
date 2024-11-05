{{ config(materialized='table') }}

select 
    row_number() over(order by l.id) as id,
    l.id as listing_id,
    l.street,
    l.neighbourhood,
    l.neighbourhood_cleansed,
    l.neighbourhood_group_cleansed,
    l.city,
    l.state,
    l.zipcode,
    l.market,
    l.smart_location,
    l.country,
    l.country_code,
    l.latitude,
    l.longitude,

    
from
    {{ ref('cleansed_listings') }} as l