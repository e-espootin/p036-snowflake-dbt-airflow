{% macro test_assert_no_duplicates(model, columns) %}

WITH duplicates AS (
    SELECT
        {{ columns | join(', ') }},
        COUNT(*) AS count
    FROM {{ model }}
    GROUP BY {{ columns | join(', ') }}
    HAVING COUNT(*) > 1
)

SELECT * FROM duplicates

{% endmacro %}