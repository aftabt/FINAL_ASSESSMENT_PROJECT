# FINAL_ASSESSMENT_PROJECT
Repository contain project on "Scope of Work (SoW) for Transportation &amp; Logistics Data Processing &amp; Analysis"
Transportation Analytics Project
Project Overview
This project focuses on processing and analyzing transportation and logistics data using PySpark, MySQL, and Power BI, following the Medallion Architecture. The goal is to ingest, clean, transform, and aggregate data related to transportation routes, vehicle performance, delivery times, and shipment statuses to generate meaningful business insights.
The solution provides a fully automated data pipeline from raw data ingestion to visualization, with proper auditing at each stage. Data engineers only need to add new data to the raw files - the pipeline then triggers automatically and updates the Power BI dashboard with fresh insights.
Architecture
The entire project is built on Microsoft Azure platform, following the Medallion Architecture for data processing:
Software & Tools Used

Azure Blob Storage: Stores raw data files
Azure Data Lake Storage Gen2: Implements medallion architecture layers
Azure Databricks Service: Runs PySpark scripts for data processing
Azure Database for MySQL server: Stores transformed data & final aggregated results
Azure Data Factory: Orchestrates and automates the entire pipeline
Power BI: Visualizes data & provides interactive dashboards

Medallion Architecture Components
The project follows a structured three-layer approach:

Bronze Layer: Stores raw data with minimal processing (Parquet files)
Silver Layer: Contains cleansed, transformed, and enriched data (Parquet & MySQL tables)
Gold Layer: Houses aggregated data optimized for reporting & dashboards (MySQL tables)

Data Processing Pipeline
The automated data pipeline performs the following operations:
Bronze Layer Processing

Copies raw CSV data files to bronze container with parquet format
Adds audit columns (ingestion_date, source_file) to track data lineage
Generates detailed logs for each file processing operation

Silver Layer Transformations

Data Cleaning: Removes records with null values in critical columns
Table Joins: Combines vehicle details, driver details, and route information
Feature Engineering: Computes additional fields like fuel_consumed = distance_covered / fuel_efficiency
Data Type Conversion: Ensures proper data types for analytics
Storage: Stores transformed data in both Parquet format and MySQL tables

Gold Layer Aggregations
The gold layer performs advanced analytics:

Route Optimization Analysis: Analyzes delivery times and fuel consumption by route
Fleet Performance Analysis: Evaluates vehicle performance metrics
Driver Performance Analysis: Measures driver efficiency and ratings
Unified Gold Table: Combines all aggregations into a comprehensive analytics table
Dual Storage: Saves results in both Parquet files and MySQL tables

Power BI Dashboard
The final dashboard provides key business insights through:
Key Performance Indicators (KPIs)

Total Deliveries: Sum of deliveries per route/vehicle/driver
Average Delivery Time: Average time per route/vehicle/driver
Fuel Efficiency: Average fuel efficiency per vehicle
Driver Performance: Average driver rating
Delivery Status: Completed vs Failed deliveries

Interactive Visualizations

Route Optimization Chart: Line chart showing average delivery times and fuel consumption per route
Fleet Performance Analysis: Bar chart visualizing total deliveries per vehicle and fuel efficiency
Driver Performance Analysis: Scatter plot for driver performance metrics
Delivery Status Distribution: Pie chart showing the distribution of completed and failed deliveries
Time-based Delivery Trends: Line chart showing monthly/weekly delivery performance trends

Interactive Filters

Filter by delivery status (completed/failed)
Filter by route name
Filter by driver name

Project Structure
Copy├── Azure Resources 
│   ├── bizblobstore (Azure Blob Storage)
│   │   └── raw (container for raw CSV files)
│   ├── bizlakegen (Azure Data Lake Storage Gen2)
│   │   ├── bronze (container for parquet files)
│   │   ├── silver (container for transformed data)
│   │   └── gold (container for aggregated data)
│   ├── bizserver (Azure Database for MySQL server)
│   │   ├── silver_db (schema for silver layer)
│   │   └── gold_db (schema for gold layer)
│   ├── BizWorkSpace (Azure Databricks Service)
│   └── bizdatafactory (Azure Data Factory)
│       ├── datasets (14 different datasets)
│       ├── dataflows (Silver layer transformations)
│       └── pipelines (End-to-end orchestration)
├── SQL
│   ├── silver_db.sql (SQL script for silver layer)
│   └── gold_db.sql (SQL script for gold layer)
├── Databricks
│   └── gold_layer_aggregation.ipynb (PySpark notebook)
└── PowerBI
    └── transportation_dashboard.pbix (Power BI dashboard)
Setup Instructions

Set up Azure resources as described in the project structure
Configure Azure Data Factory connections
Import the SQL scripts into MySQL workbench
Import the Databricks notebook
Connect Power BI to the Gold layer MySQL database

Future Enhancements

Add real-time data processing capabilities
Implement machine learning models for predictive analytics
Expand the dashboard with additional visualizations
Add alert systems for critical performance metrics

