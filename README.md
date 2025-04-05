# 🚚 Transportation & Logistics Data Platform using Medallion Architecture

## 📘 Abstract

This project focuses on processing and analyzing transportation and logistics data using **PySpark**, **MySQL**, and **Power BI**, all orchestrated within the **Microsoft Azure ecosystem**. The objective is to build a **scalable, automated data platform** using the **Medallion Architecture**, from raw data ingestion to final dashboard reporting.

Data engineers or customers simply need to add new data to raw files — the entire pipeline gets triggered automatically, and updated insights are reflected on the Power BI dashboard.

---

## 🧭 Table of Contents

1. [Technologies Used](#technologies-used)
2. [Medallion Architecture Overview](#medallion-architecture-overview)
3. [Platform Setup](#platform-setup)
   - Azure Resource Group
   - Azure Blob Storage (Raw)
   - Azure Data Lake Gen2 (Bronze, Silver, Gold)
   - Azure MySQL Database
   - Azure Databricks
   - Azure Data Factory
4. [Bronze Layer Implementation](#bronze-layer-implementation)
5. [Silver Layer Implementation](#silver-layer-implementation)
6. [Gold Layer Implementation](#gold-layer-implementation)
7. [Power BI Dashboard](#power-bi-dashboard)
8. [Conclusion](#conclusion)

---

## 🛠️ Technologies Used

- Microsoft Azure (Blob Storage, Data Lake Gen2, ADF, Databricks, MySQL)
- PySpark (Data Processing & Transformation)
- MySQL Workbench (SQL queries & schema creation)
- Azure Data Factory (Pipeline Automation)
- Power BI (Data Visualization & Reporting)

---

## 🧱 Medallion Architecture Overview

- **Bronze Layer:** Stores raw data (Parquet format) with audit logs.
- **Silver Layer:** Cleaned, structured, and enriched data.
- **Gold Layer:** Aggregated data ready for reporting and visualization.

---

## ⚙️ Platform Setup

### Microsoft Azure Overview
![IMAGE 1](#)

### Azure Resource Group - BizRG
Contains all services like Storage Accounts, Data Factory, MySQL, and Databricks.  
![IMAGE 2](#)

### Azure Blob Storage - bizblobstore (Raw Data)
Container: `raw/` containing 4 CSV files.  
![IMAGE 3](#)  
![IMAGE 4](#)

### Azure Data Lake Gen2 - bizlakegen (Medallion Layers)
Containers: `bronze/`, `silver/`, `gold/`  
![IMAGE 5](#)  
![IMAGE 6](#)

### Azure MySQL Database
Created a Flexible Server and connected to MySQL Workbench.  
![IMAGE 7](#)  
![IMAGE 8](#)

### Azure Databricks
Service: BizWorkspace  
Notebook used for gold layer aggregation.  
![IMAGE 9](#)

### Azure Data Factory (ADF) - bizdatafactory
All orchestration and pipeline automation.  
![IMAGE 10](#)

---

## 🥉 Bronze Layer Implementation

- **Source:** CSV files from Blob Storage
- **Process:** Copy activity with audit columns (`ingestion_date`, `source_file`)
- **Destination:** Parquet format in Bronze container

#### Connections and Datasets
![IMAGE 11](#)  
![IMAGE 12](#)

#### Copy Activities for Each File
![IMAGE 13](#)  
![IMAGE 14](#)  
![IMAGE 15](#)  
![IMAGE 16](#)  
![IMAGE 17](#)  
![IMAGE 18](#)

#### Sample Data and Logs
![IMAGE 19](#)  
![IMAGE 20](#)

---

## 🥈 Silver Layer Implementation

### Process (via Data Flow)
1. Filter nulls
2. Select relevant features
3. Join all 4 data sources
4. Compute new columns: `fuel_consumed`, `processed_date`, `route_name`
5. Type casting
6. Store in MySQL (`silver_db`) and Silver container

#### Data Flow Steps
![IMAGE 20](#)  
![IMAGE 21](#)  
![IMAGE 22](#)  
![IMAGE 23](#)  
![IMAGE 24](#)  
![IMAGE 25](#)  
![IMAGE 26](#)  
![IMAGE 27](#)  
![IMAGE 28](#)  
![IMAGE 29](#)  
![IMAGE 30](#)

#### MySQL Silver DB Setup
![IMAGE 31](#)  
![IMAGE 32](#)  
![IMAGE 33](#)

#### Final Silver Output
- **Parquet in Silver Container:**  
  ![IMAGE 34](#)
- **MySQL Table in `silver_db`:**  
  ![IMAGE 35](#)

---

## 🥇 Gold Layer Implementation

### Process (via PySpark in Databricks)
1. Read `silver_db.delivery_data_silver` table
2. Perform Aggregations:
   - Route Optimization
   - Fleet Performance
   - Driver Performance
3. Join and prepare final Gold Table
4. Write to:
   - `gold_db` in MySQL
   - `gold/` container as Parquet
5. Include logging file

#### Databricks Cluster & Notebook
![IMAGE 36](#)  
![IMAGE 37](#)

#### Notebook Deployed in Pipeline
![IMAGE 38](#)  
![IMAGE 39](#)

#### Gold Table Outputs
- **MySQL Table (`gold_db.transportation_gold`)**  
  ![IMAGE 40](#)
- **Gold Container with Logging File**  
  ![IMAGE 41](#)  
  ![IMAGE 42](#)

---

## 📊 Power BI Dashboard

Connected to `gold_db.transportation_gold` via MySQL connector from Azure Server.  
![IMAGE 43](#)

### KPIs Displayed:
1. **Total Deliveries**
2. **Average Delivery Time**
3. **Fuel Efficiency**
4. **Driver Performance**
5. **Delivery Status**

### Dashboard Preview
![IMAGE 44](#)

### Filters & Visualizations:
- **Slicers:**
  - Delivery Status
  - Route Name
  - Driver Name
- **Charts:**
  - Route Optimization (Line)
  - Fleet Performance (Bar)
  - Driver Performance (Scatter)
  - Delivery Status Distribution (Pie)
  - Time-based Trends (Line)

#### Example Dashboards:
- **Filtered by Deliveries Completed:**  
  ![IMAGE 45](#)
- **Filtered by Route & Driver Name:**  
  ![IMAGE 46](#)

---

## ✅ Conclusion

This end-to-end data engineering project demonstrates the power of **automated pipelines** using the **Medallion Architecture**. From raw CSVs to a dynamic business dashboard, the system is designed to scale and adapt with minimal user input.

Once raw data is uploaded, everything from processing to visualization is **triggered automatically**, showcasing the synergy of **Azure + PySpark + Power BI**.

---

## 📂 Folder Structure (Optional)

