
# 📊  FinOps Dashboard

This project builds a fully serverless dashboard for visualizing AWS cloud spend. It ingests AWS Cost and Usage Reports (CUR), processes them through Glue and Athena, and displays insights in Amazon QuickSight.



## 📌 Features

- **Automated CUR Ingestion**
  Supports integration with AWS CUR for continuous cost reporting via S3.

- **ETL with AWS Glue**
  Transforms CUR data into a partitioned, query-optimized format.

- **Serverless Analytics with Athena**
  Enables SQL-based exploration of cloud costs by service, region, and account.

- **Dashboards with QuickSight**
  Visualizes cost drivers, trends, and usage anomalies.

- **Monitoring with CloudWatch**
  Observes job executions and tracks performance logs.



## 🧭 Workflow

1. AWS Cost and Usage Reports (CUR) are automatically delivered to an S3 bucket.
2. AWS Glue ETL jobs catalog and transform the data.
3. Athena queries summarize cost metrics across dimensions.
4. Amazon QuickSight dashboards display actionable KPIs.



## ⚙️ Architecture Overview

```plaintext
[AWS CUR Files] → [Amazon S3] → [AWS Glue ETL] → [Amazon Athena Queries] → [Amazon QuickSight Dashboards]
                                                           ↓
                                                   [CloudWatch Logs]
```




## 🧩 Technologies Used

- **Amazon S3** – Stores CUR data for processing  
- **AWS Glue** – ETL transformation and data cataloging  
- **Amazon Athena** – On-demand SQL analytics  
- **Amazon QuickSight** – Data visualization layer  
- **AWS CloudWatch** – Monitoring and logging  
- **SQL, Python** – Used for transformation logic and analytics queries



## 🧠 Challenge Faced

Configuring proper partitioning and schema inference for large CUR files in Glue was essential for performance. Optimizing Athena queries to handle large datasets without timeouts required fine-tuning and understanding of CUR schema structure.



## 🧪 Getting Started

1. Enable and configure AWS Cost and Usage Reports to deliver data to an S3 bucket.  
2. Set up and run AWS Glue crawlers and ETL jobs to transform and catalog data.  
3. Use Athena to define cost-related SQL queries.  
4. Build dashboards in Amazon QuickSight using Athena datasets.

### Dashboard Demo
![AWS Cost Monitoring Dashboard](Screenshot%202025-06-14%20175220(1).png)



## 👤 Author

**Salma Mohamed Kassem**  



