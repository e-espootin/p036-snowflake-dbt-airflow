{{ config(materialized='table') }}

select 
    c.DATE,
    EXTRACT(YEAR FROM DATE) AS year,
    EXTRACT(MONTH FROM DATE) AS month,
    EXTRACT(DAY FROM DATE) AS day,
    EXTRACT(QUARTER FROM DATE) AS quarter,
    DAYOFYEAR(DATE) AS day_of_year,
    WEEKOFYEAR(DATE) AS week_of_year,
    CEIL(DAY(DATE) / 7) AS week_of_month,
    DAYOFWEEK(DATE) AS day_of_week_index,  -- 1=Sunday, 7=Saturday
    DAYNAME(DATE) AS day_name,
    MONTHNAME(DATE) AS month_name,
    CASE
        WHEN DAYOFWEEK(DATE) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS is_weekend,
    LAST_DAY(DATE, 'MONTH') AS last_day_of_month,
    DATE_TRUNC('WEEK', DATE) AS week_start_date,
    DATE_TRUNC('MONTH', DATE) AS month_start_date,
    DATE_TRUNC('QUARTER', DATE) AS quarter_start_date,
    DATE_TRUNC('YEAR', DATE) AS year_start_date
from
    {{ ref('cleansed_Calendar') }} as c