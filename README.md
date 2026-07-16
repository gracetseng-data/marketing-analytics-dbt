# Marketing Analytics dbt Project

An end-to-end analytics engineering portfolio project built with dbt Core, SQL, and DuckDB.

This project transforms simulated advertising campaign data into reliable, tested, and analytics-ready datasets using staging, dimension, and fact models.

> Status: MVP completed

## Project Overview

The project demonstrates a complete analytics engineering workflow:

```text
Simulated Marketing CSV
          ↓
       dbt Seed
          ↓
stg_campaign_performance
          ↓
    ┌─────┴──────────────────┐
    ↓                        ↓
dim_campaigns     fct_daily_campaign_performance
```

## Data Models

### `raw_campaign_performance`

A simulated CSV dataset containing daily campaign performance from:

- Google Ads
- Meta Ads

The dataset includes:

- Date
- Platform
- Campaign ID
- Campaign name
- Impressions
- Clicks
- Spend
- Conversions
- Revenue

### `stg_campaign_performance`

A staging view that cleans and standardizes the raw data.

Transformations include:

- Converting dates and numeric fields into appropriate data types
- Standardizing advertising platform names
- Trimming campaign identifiers and names
- Preparing consistent fields for downstream models

### `dim_campaigns`

A dimension table containing one record for each platform and campaign combination.

Key fields:

- `campaign_key`
- `platform`
- `campaign_id`
- `campaign_name`

### `fct_daily_campaign_performance`

A fact table containing daily performance metrics for each campaign.

Metrics include:

- Impressions
- Clicks
- Advertising spend
- Conversions
- Revenue
- Click-through rate
- Cost per click
- Cost per acquisition
- Return on ad spend

## Data Quality Tests

The project includes 26 automated dbt tests covering:

- Required non-null fields
- Unique primary keys
- Accepted platform values
- Unique daily campaign records
- Fact-to-dimension relationships

Latest build result:

```text
PASS=30
WARN=0
ERROR=0
```

The complete build includes:

- 1 seed
- 1 staging view
- 2 mart tables
- 26 data tests

## Technologies

- SQL
- dbt Core
- DuckDB
- Python
- Git
- GitHub

## Project Structure

```text
marketing-analytics-dbt/
├── README.md
├── marketing_analytics/
│   ├── dbt_project.yml
│   ├── models/
│   │   ├── staging/
│   │   │   ├── stg_campaign_performance.sql
│   │   │   └── schema.yml
│   │   └── marts/
│   │       ├── dim_campaigns.sql
│   │       ├── fct_daily_campaign_performance.sql
│   │       └── schema.yml
│   ├── seeds/
│   │   └── raw_campaign_performance.csv
│   ├── analyses/
│   ├── macros/
│   ├── snapshots/
│   └── tests/
└── .gitignore
```

## Running the Project

Create and activate a Python virtual environment:

```bat
python -m venv .venv
.venv\Scripts\activate
```

Install the DuckDB adapter for dbt:

```bat
python -m pip install dbt-duckdb
```

Enter the dbt project directory:

```bat
cd marketing_analytics
```

Run the complete pipeline and all tests:

```bat
dbt build
```

Generate and view the dbt documentation and lineage graph:

```bat
dbt docs generate
dbt docs serve
```

## Data Privacy

All data in this repository is simulated.

The project does not contain:

- Company data
- Database credentials
- Internal source code
- API tokens
- Private database connections
- Confidential business information

## Author

Grace Tseng

Data Analyst building toward Analytics Engineering and cloud-based Data Engineering roles.