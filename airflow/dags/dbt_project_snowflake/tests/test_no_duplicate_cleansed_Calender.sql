SELECT
    LISTING_ID,
    Date,
    COUNT(*) AS duplicate_count
FROM {{ ref('cleansed_Calendar') }}
GROUP BY LISTING_ID, Date
HAVING COUNT(*) > 1