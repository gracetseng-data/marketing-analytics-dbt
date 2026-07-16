{{ config(materialized='table') }}

with campaign_performance as (

    select
        performance_date,
        platform || '_' || campaign_id as campaign_key,
        impressions,
        clicks,
        spend,
        conversions,
        revenue

    from {{ ref('stg_campaign_performance') }}

),

final as (

    select
        cast(performance_date as varchar)
            || '_'
            || campaign_key as daily_campaign_key,

        performance_date,
        campaign_key,
        impressions,
        clicks,
        spend,
        conversions,
        revenue,

        round(
            clicks * 1.0 / nullif(impressions, 0),
            4
        ) as click_through_rate,

        round(
            spend / nullif(clicks, 0),
            2
        ) as cost_per_click,

        round(
            spend / nullif(conversions, 0),
            2
        ) as cost_per_acquisition,

        round(
            revenue / nullif(spend, 0),
            2
        ) as return_on_ad_spend

    from campaign_performance

)

select *
from final