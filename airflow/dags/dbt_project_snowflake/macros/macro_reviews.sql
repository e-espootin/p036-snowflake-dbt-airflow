{% macro transform_table_reviews(source_name, table_name) %}
  {{ config(materialized='view') }}

with raw_{{ table_name }}
as(

    select 
        cast(listing_id    as numeric(38, 0)) as listing_id
        , cast(id as numeric(38, 0)) as id
        , cast(date as Date) as date
        , cast(reviewer_id    as numeric(38, 0)) as reviewer_id
        , cast(reviewer_name as varchar(150)) as reviewer_name
        , cast(comments as varchar(8000)) as comments
    from {{ source(source_name, table_name) }}
)

select *
from raw_{{ table_name }}

{% endmacro %}

