# Marketing Analytics dbt Project

An end-to-end analytics engineering portfolio project built with dbt and SQL.

This project transforms raw marketing campaign data into reliable, tested, and analytics-ready datasets for reporting and business analysis.

> Status: Work in progress

## Project Goals

- Organize raw advertising data using dbt
- Build reusable staging and mart models
- Design fact and dimension tables
- Add automated data quality tests
- Generate dbt documentation and data lineage
- Prepare analytics-ready datasets for dashboards

## Planned Data Sources

The project will use simulated marketing data representing:

- Google Ads
- Meta Ads
- Campaign performance
- Advertising costs
- Clicks, impressions, and conversions

No confidential company data is included in this repository.

## Planned Architecture

`Raw CSV Data → dbt Sources → Staging Models → Intermediate Models → Data Marts → Tests → Documentation`

## Planned Data Models

### Staging

- `stg_google_ads`
- `stg_meta_ads`
- `stg_campaigns`

### Dimensions

- `dim_campaigns`
- `dim_channels`
- `dim_dates`

### Facts

- `fct_daily_campaign_performance`

## Technologies

- SQL
- dbt Core
- DuckDB
- Python
- Git and GitHub

## Data Quality Tests

The project will include tests for:

- Unique primary keys
- Required non-null values
- Accepted channel values
- Valid table relationships
- Non-negative advertising metrics

## Project Structure

```text
marketing-analytics-dbt/
├── data/
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
├── seeds/
├── snapshots/
├── tests/
├── dbt_project.yml
└── README.md
