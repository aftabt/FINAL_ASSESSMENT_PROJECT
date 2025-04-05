🚚 Transportation & Logistics Data Platform using Medallion Architecture

📘 Abstract

This project focuses on processing and analyzing transportation and logistics data using **PySpark**, **MySQL**, and **Power BI**, all orchestrated within the **Microsoft Azure ecosystem**. The objective is to build a **scalable, automated data platform** using the **Medallion Architecture**, from raw data ingestion to final dashboard reporting.

Data engineers or customers simply need to add new data to raw files — the entire pipeline gets triggered automatically, and updated insights are reflected on the Power BI dashboard.

---

👭 Table of Contents

1. Technologies Used
2. Medallion Architecture Overview
3. Platform Setup
   - Azure Resource Group
   - Azure Blob Storage (Raw)
   - Azure Data Lake Gen2 (Bronze, Silver, Gold)
   - Azure MySQL Database
   - Azure Databricks
   - Azure Data Factory
4. Bronze Layer Implementation
5. Silver Layer Implementation
6. Gold Layer Implementation
7. Power BI Dashboard
8. Conclusion

---

🛠️ Technologies Used

- Microsoft Azure (Blob Storage, Data Lake Gen2, ADF, Databricks, MySQL)
- PySpark (Data Processing & Transformation)
- MySQL Workbench (SQL queries & schema creation)
- Azure Data Factory (Pipeline Automation)
- Power BI (Data Visualization & Reporting)

---

🧱 Medallion Architecture Overview

- **Bronze Layer:** Stores raw data (Parquet format) with audit logs.
- **Silver Layer:** Cleaned, structured, and enriched data.
- **Gold Layer:** Aggregated data ready for reporting and visualization.

---

⚙️ Platform Setup

### Microsoft Azure Overview

### Azure Resource Group - BizRG
Contains all services like Storage Accounts, Data Factory, MySQL, and Databricks.  

### Azure Blob Storage - bizblobstore (Raw Data)
Container: `raw/` containing 4 CSV files.  

### Azure Data Lake Gen2 - bizlakegen (Medallion Layers)
Containers: `bronze/`, `silver/`, `gold/`  

### Azure MySQL Database
Created a Flexible Server and connected to MySQL Workbench.  

### Azure Databricks
Service: BizWorkspace  
Notebook used for gold layer aggregation.  

### Azure Data Factory (ADF) - bizdatafactory
All orchestration and pipeline automation.  

---

🥍 Bronze Layer Implementation

- **Source:** CSV files from Blob Storage
- **Process:** Copy activity with audit columns (`ingestion_date`, `source_file`)
- **Destination:** Parquet format in Bronze container

#### Connections and Datasets

#### Copy Activities for Each File

#### Sample Data and Logs

---

🥈 Silver Layer Implementation

### Process (via Data Flow)
1. Filter nulls
2. Select relevant features
3. Join all 4 data sources
4. Compute new columns: `fuel_consumed`, `processed_date`, `route_name`
5. Type casting
6. Store in MySQL (`silver_db`) and Silver container

#### Data Flow Steps

#### MySQL Silver DB Setup

#### Final Silver Output
- **Parquet in Silver Container**
- **MySQL Table in `silver_db`**

---

🥇 Gold Layer Implementation

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

#### Notebook Deployed in Pipeline

#### Gold Table Outputs
- **MySQL Table (`gold_db.transportation_gold`)**
- **Gold Container with Logging File**

---

📊 Power BI Dashboard

Connected to `gold_db.transportation_gold` via MySQL connector from Azure Server.

### KPIs Displayed:
1. **Total Deliveries**
2. **Average Delivery Time**
3. **Fuel Efficiency**
4. **Driver Performance**
5. **Delivery Status**

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
- **Filtered by Deliveries Completed**
- **Filtered by Route & Driver Name**

---

✅ Conclusion

This end-to-end data engineering project demonstrates the power of **automated pipelines** using the **Medallion Architecture**. From raw CSVs to a dynamic business dashboard, the system is designed to scale and adapt with minimal user input.

Once raw data is uploaded, everything from processing to visualization is **triggered automatically**, showcasing the synergy of **Azure + PySpark + Power BI**.

---
