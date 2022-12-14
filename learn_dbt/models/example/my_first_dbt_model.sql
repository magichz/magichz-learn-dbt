/*
 Welcome to your first dbt model!
 Did you know that you can also configure models directly within SQL files?
 This will override configurations stated in dbt_project.yml
 
 Try changing "table" to "view" below
 */
{{ config(
    materialized = 'table',
    alias = 'first_model'
) }}

WITH source_data AS (

    SELECT
        1 AS id
    UNION ALL
    SELECT
        NULL AS id
    UNION ALL
    SELECT
        3 AS id
)
SELECT
    *
FROM
    source_data
