{{ config(materialized='table') }}

select 
    row_number() over(order by l.id) as id,
    l.id as listing_id,
    l.host_id,
    l.host_name,
    l.host_since,
    l.host_location,
    l.host_response_time,
    l.host_response_rate,
    l.host_acceptance_rate,
    l.host_is_superhost,
    l.host_neighbourhood,
    l.host_listings_count,
    l.host_total_listings_count,
    l.host_verifications,
    l.host_has_profile_pic,
    l.host_identity_verified
    
from
    {{ ref('cleansed_listings') }} as l