{{ config(materialized='incremental') }}

select 
    lis.ID
    ,lis.price
    , lis.weekly_price
    , lis.monthly_price
    , lis.security_deposit
    , lis.cleaning_fee
    , lis.guests_included
    , lis.extra_people
    , lis.number_of_reviews
    , lis.reviews_per_month
    , lis.availability_365
    , lis.REVIEW_SCORES_RATING
    --
    , cal.Date
    , prop.id as property_id
    , loc.id as location_id
    , host.id as host_id
    --
from
    {{ ref('cleansed_listings') }} as lis
join
    {{ ref('cleansed_Calendar') }} as cal
        on cal.LISTING_ID = lis.ID
join
    {{ ref('dim_date') }} as dim
        on dim.Date = cal.Date
join 
    {{ ref('dim_property') }} as prop
        on prop.listing_id = lis.ID 
join
    {{ ref('dim_location') }} as loc
        on loc.listing_id = lis.ID
join
    {{ ref('dim_host') }} as host
        on host.listing_id = lis.ID
WHERE lis.ID > (SELECT MAX(ID) FROM {{ this }})
order by
    lis.ID desc
