{{ config(materialized='view') }}

with source_data as (

    select *
    from {{ ref('raw_campaign_performance') }}

),

cleaned_data as (

    select
        cast("date" as date) as performance_date,
        lower(trim(platform)) as platform,
        trim(campaign_id) as campaign_id,
        trim(campaign_name) as campaign_name,
        cast(impressions as bigint) as impressions,
        cast(clicks as bigint) as clicks,
        cast(spend as decimal(18, 2)) as spend,
        cast(conversions as bigint) as conversions,
        cast(revenue as decimal(18, 2)) as revenue

    from source_data

)

select *
from cleaned_data