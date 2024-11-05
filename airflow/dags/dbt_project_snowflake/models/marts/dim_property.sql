{{ config(materialized='table') }}

select 
    row_number() over(order by l.id) as id,
    l.id as listing_id,
    l.property_type,
    l.room_type,
    l.bed_type,
    l.accommodates,
    l.bathrooms,
    l.bedrooms,
    l.beds,
    l.amenities,
    l.square_feet,
    

    
from
    {{ ref('cleansed_listings') }} as l