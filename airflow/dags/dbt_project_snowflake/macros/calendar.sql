{% macro transform_table_calendar(source_name, table_name) %}
  {{ config(materialized='view') }}

with raw_{{ table_name }}
as(

    select 
        cast(Listing_ID    as numeric(38, 0)) as Listing_ID
        ,cast(Date as Date) as Date
        , cast(Available as varchar(5)) as Available
        , cast(Price as numeric(12, 2)) as Price
    from {{ source(source_name, table_name) }}
)

select *
from raw_{{ table_name }}

{% endmacro %}