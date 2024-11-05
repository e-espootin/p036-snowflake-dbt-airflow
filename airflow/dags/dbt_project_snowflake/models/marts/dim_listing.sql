{{ config(materialized='table') }}

select 
    row_number() over(order by l.id) as id,
    l.id as listing_id,
    l.listing_url,
    l.name,
    l.summary,
    l.space,
    l.description,
    l.experiences_offered,
    l.neighborhood_overview,
    l.notes,
    l.transit,
    -- l.interaction,
    l.minimum_nights,
    l.maximum_nights,
    l.calendar_updated,
    l.has_availability,
    l.is_location_exact,
    l.requires_license,
    l.require_guest_profile_picture,
    l.require_guest_phone_verification,

from
    {{ ref('cleansed_listings') }} as l