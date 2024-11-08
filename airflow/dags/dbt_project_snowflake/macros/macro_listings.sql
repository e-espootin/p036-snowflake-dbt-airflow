{% macro transform_table_listings(source_name, table_name) %}
  {{ config(materialized='view') }}

with raw_{{ table_name }}
as(

    select  
    cast(ID as numeric(38, 0)) as ID,
    cast(LISTING_URL as varchar(4000)) as LISTING_URL,
    cast(SCRAPE_ID as numeric(38, 0)) as SCRAPE_ID,
    cast(LAST_SCRAPED as date) as LAST_SCRAPED,
    cast(NAME as varchar(4000)) as NAME,
    cast(SUMMARY as varchar(4000)) as SUMMARY,
    cast(SPACE as varchar(4000)) as SPACE,
    cast(DESCRIPTION as varchar(4000)) as DESCRIPTION,
    cast(EXPERIENCES_OFFERED as varchar(4000)) as EXPERIENCES_OFFERED,
    cast(NEIGHBORHOOD_OVERVIEW as varchar(4000)) as NEIGHBORHOOD_OVERVIEW,
    cast(NOTES as varchar(4000)) as NOTES,
    cast(TRANSIT as varchar(4000)) as TRANSIT,
    cast(THUMBNAIL_URL as varchar(4000)) as THUMBNAIL_URL,
    cast(MEDIUM_URL as varchar(4000)) as MEDIUM_URL,
    cast(PICTURE_URL as varchar(4000)) as PICTURE_URL,
    cast(XL_PICTURE_URL as varchar(4000)) as XL_PICTURE_URL,
    cast(HOST_ID as numeric(38, 0)) as HOST_ID,
    cast(HOST_URL as varchar(4000)) as HOST_URL,
    cast(HOST_NAME as varchar(4000)) as HOST_NAME,
    cast(HOST_SINCE as date) as HOST_SINCE,
    cast(HOST_LOCATION as varchar(4000)) as HOST_LOCATION,
    cast(HOST_ABOUT as varchar(4000)) as HOST_ABOUT,
    cast(HOST_RESPONSE_TIME as varchar(4000)) as HOST_RESPONSE_TIME,
    cast(HOST_RESPONSE_RATE as varchar(4000)) as HOST_RESPONSE_RATE,
    cast(HOST_ACCEPTANCE_RATE as varchar(4000)) as HOST_ACCEPTANCE_RATE,
    cast(HOST_IS_SUPERHOST as varchar(4000)) as HOST_IS_SUPERHOST,
    cast(HOST_THUMBNAIL_URL as varchar(4000)) as HOST_THUMBNAIL_URL,
    cast(HOST_PICTURE_URL as varchar(4000)) as HOST_PICTURE_URL,
    cast(HOST_NEIGHBOURHOOD as varchar(4000)) as HOST_NEIGHBOURHOOD,
    cast(HOST_LISTINGS_COUNT as numeric(38, 0)) as HOST_LISTINGS_COUNT,
    cast(HOST_TOTAL_LISTINGS_COUNT as numeric(38, 0)) as HOST_TOTAL_LISTINGS_COUNT,
    cast(HOST_VERIFICATIONS as varchar(4000)) as HOST_VERIFICATIONS,
    cast(HOST_HAS_PROFILE_PIC as varchar(4000)) as HOST_HAS_PROFILE_PIC,
    cast(HOST_IDENTITY_VERIFIED as varchar(4000)) as HOST_IDENTITY_VERIFIED,
    cast(STREET as varchar(4000)) as STREET,
    cast(NEIGHBOURHOOD as varchar(4000)) as NEIGHBOURHOOD,
    cast(NEIGHBOURHOOD_CLEANSED as varchar(4000)) as NEIGHBOURHOOD_CLEANSED,
    cast(NEIGHBOURHOOD_GROUP_CLEANSED as varchar(4000)) as NEIGHBOURHOOD_GROUP_CLEANSED,
    cast(CITY as varchar(4000)) as CITY,
    cast(STATE as varchar(4000)) as STATE,
    cast(ZIPCODE as varchar(4000)) as ZIPCODE,
    cast(MARKET as varchar(4000)) as MARKET,
    cast(SMART_LOCATION as varchar(4000)) as SMART_LOCATION,
    cast(COUNTRY_CODE as varchar(4000)) as COUNTRY_CODE,
    cast(COUNTRY as varchar(4000)) as COUNTRY,
    cast(LATITUDE as float) as LATITUDE,
    cast(LONGITUDE as float) as LONGITUDE,
    cast(IS_LOCATION_EXACT as varchar(4000)) as IS_LOCATION_EXACT,
    cast(PROPERTY_TYPE as varchar(4000)) as PROPERTY_TYPE,
    cast(ROOM_TYPE as varchar(4000)) as ROOM_TYPE,
    cast(ACCOMMODATES as numeric(38, 0)) as ACCOMMODATES,
    cast(BATHROOMS as float) as BATHROOMS,
    cast(BEDROOMS as numeric(38, 0)) as BEDROOMS,
    cast(BEDS as numeric(38, 0)) as BEDS,
    cast(BED_TYPE as varchar(4000)) as BED_TYPE,
    cast(AMENITIES as varchar(4000)) as AMENITIES,
    cast(SQUARE_FEET as numeric(38, 0)) as SQUARE_FEET,
    cast(PRICE as numeric(38, 0)) as PRICE,
    cast(WEEKLY_PRICE as numeric(38, 0)) as WEEKLY_PRICE,
    cast(MONTHLY_PRICE as numeric(38, 0)) as MONTHLY_PRICE,
    cast(SECURITY_DEPOSIT as numeric(38, 0)) as SECURITY_DEPOSIT,
    cast(CLEANING_FEE as numeric(38, 0)) as CLEANING_FEE,
    cast(GUESTS_INCLUDED as numeric(38, 0)) as GUESTS_INCLUDED,
    cast(EXTRA_PEOPLE as numeric(38, 0)) as EXTRA_PEOPLE,
    cast(MINIMUM_NIGHTS as numeric(38, 0)) as MINIMUM_NIGHTS,
    cast(MAXIMUM_NIGHTS as numeric(38, 0)) as MAXIMUM_NIGHTS,
    cast(CALENDAR_UPDATED as varchar(4000)) as CALENDAR_UPDATED,
    cast(HAS_AVAILABILITY as varchar(4000)) as HAS_AVAILABILITY,
    cast(AVAILABILITY_30 as numeric(38, 0)) as AVAILABILITY_30,
    cast(AVAILABILITY_60 as numeric(38, 0)) as AVAILABILITY_60,
    cast(AVAILABILITY_90 as numeric(38, 0)) as AVAILABILITY_90,
    cast(AVAILABILITY_365 as numeric(38, 0)) as AVAILABILITY_365,
    cast(CALENDAR_LAST_SCRAPED as date) as CALENDAR_LAST_SCRAPED,
    cast(NUMBER_OF_REVIEWS as numeric(38, 0)) as NUMBER_OF_REVIEWS,
    cast(FIRST_REVIEW as date) as FIRST_REVIEW,
    cast(LAST_REVIEW as date) as LAST_REVIEW,
    cast(REVIEW_SCORES_RATING as numeric(38, 0)) as REVIEW_SCORES_RATING,
    cast(REVIEW_SCORES_ACCURACY as numeric(38, 0)) as REVIEW_SCORES_ACCURACY,
    cast(REVIEW_SCORES_CLEANLINESS as numeric(38, 0)) as REVIEW_SCORES_CLEANLINESS,
    cast(REVIEW_SCORES_CHECKIN as numeric(38, 0)) as REVIEW_SCORES_CHECKIN,
    cast(REVIEW_SCORES_COMMUNICATION as numeric(38, 0)) as REVIEW_SCORES_COMMUNICATION,
    cast(REVIEW_SCORES_LOCATION as numeric(38, 0)) as REVIEW_SCORES_LOCATION,
    cast(REVIEW_SCORES_VALUE as numeric(38, 0)) as REVIEW_SCORES_VALUE,
    cast(REQUIRES_LICENSE as varchar(4000)) as REQUIRES_LICENSE,
    cast(LICENSE as numeric(38, 0)) as LICENSE,
    cast(JURISDICTION_NAMES as varchar(4000)) as JURISDICTION_NAMES,
    cast(INSTANT_BOOKABLE as varchar(4000)) as INSTANT_BOOKABLE,
    cast(CANCELLATION_POLICY as varchar(4000)) as CANCELLATION_POLICY,
    cast(REQUIRE_GUEST_PROFILE_PICTURE as varchar(4000)) as REQUIRE_GUEST_PROFILE_PICTURE,
    cast(REQUIRE_GUEST_PHONE_VERIFICATION as varchar(4000)) as REQUIRE_GUEST_PHONE_VERIFICATION,
    cast(CALCULATED_HOST_LISTINGS_COUNT as numeric(38, 0)) as CALCULATED_HOST_LISTINGS_COUNT,
    cast(REVIEWS_PER_MONTH as float) as REVIEWS_PER_MONTH
    from {{ source(source_name, table_name) }}
)

select *
from raw_{{ table_name }}

{% endmacro %}