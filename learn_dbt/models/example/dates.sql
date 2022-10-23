{{ config(
    materialized = 'incremental',
    unique_key = 'd_date'
) }}

SELECT
    *
FROM
    snowflake_sample_data.tpcds_sf10tcl.date_dim
WHERE
    d_date <= CURRENT_DATE

{% if is_incremental() %}
AND d_date > (
    SELECT
        MAX(d_date)
    FROM
        {{ this }}
)
{% endif %}
