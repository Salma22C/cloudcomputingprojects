# 🎧 Podcast Insights Dashboard

This project builds a **serverless analytics pipeline** for extracting insights from podcast performance data. It processes structured `.csv` files containing metadata such as episode titles, publish dates, durations, and listener statistics to identify trends and high-performing content.

---

## 📌 Features

- **CSV-Based Analytics**  
  Ingests and processes podcast data stored in `.csv` format via Amazon S3.

- **ETL with AWS Glue**  
  Cleans and transforms raw data and adds it to the AWS Glue Data Catalog.

- **Athena for SQL Queries**  
  Enables querying listener trends, episode performance, and publishing schedules.

- **Monitoring with CloudWatch**  
  Logs transformation and query processes for transparency and debugging.

---

## 🧭 Workflow

1. Upload podcast `.csv` files to an S3 bucket  
2. AWS Glue ETL jobs transform and catalog the data  
3. Amazon Athena executes SQL queries over the transformed dataset  
4. (Optional) Visualize data with Amazon QuickSight

---

## ⚙️ Architecture Overview

```plaintext
[Podcast CSV Files] → [Amazon S3] → [AWS Glue ETL] → [Amazon Athena Queries]
                                                           ↓
                                                   [CloudWatch Logs]

```

---

## 🧩 Technologies Used

- **Amazon S3** – Stores uploaded podcast `.csv` data  
- **AWS Glue** – ETL jobs for transformation and schema inference  
- **Amazon Athena** – SQL querying for podcast metrics and trends  
- **AWS CloudWatch** – Logs and monitors Glue jobs and query executions  
- **SQL, Python** – Used in Athena queries and Glue ETL scripts

---

## 🧠 Challenge Faced

Working with raw `.csv` files introduced schema inconsistencies that made it difficult for AWS Glue to infer structure automatically. Fine-tuning Athena queries to efficiently aggregate listener statistics and normalize inconsistent fields was time-consuming. The project initially aimed to include visualization, but efforts focused on data ingestion and query accuracy first.

---

## 🧪 Getting Started

1. Upload your `.csv` podcast datasets to an S3 bucket  
2. Set up AWS Glue crawlers and ETL jobs for transformation and cataloging  
3. Define SQL queries in Athena to extract and aggregate insights  
4. *(Optional)* Build dashboards in Amazon QuickSight linked to Athena datasets

---
📸 Screenshots (Optional)

Although QuickSight integration is still a work in progress, here's a snapshot of the setup and testing process:

## 👤 Author

**Salma Mohamed Kassem**  


