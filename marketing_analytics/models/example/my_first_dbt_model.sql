
/*
    Welcome to your first dbt model!

    This model creates a table with two valid, non-null IDs.
    The original dbt example included a null value so that the
    not_null data test would intentionally fail.
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id

    union all

    select 2 as id

)

select *
from source_data