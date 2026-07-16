{{ config(materialized='table') }}

with campaign_data as (

    select distinct
        platform,
        campaign_id,
        campaign_name

    from {{ ref('stg_campaign_performance') }}

),

final as (

    select
        platform || '_' || campaign_id as campaign_key,
        platform,
        campaign_id,
        campaign_name

    from campaign_data

)

select *
from final