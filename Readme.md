
---
# Serverless Data Analytics and Visualization Pipeline

This project demonstrates a fully serverless data analytics and visualization pipeline using AWS services. It integrates two primary use cases:

1. **Podcast Insights Dashboard** – Processes structured `.csv` podcast data to extract listener and episode insights.
2. **AWS Cost Monitoring Dashboard** – Analyzes AWS Cost and Usage Reports (CUR) to monitor cloud expenditure by service and region.

Both pipelines are built using a modern, serverless architecture optimized for scalability, cost-efficiency, and automation.

---

## Features

- **Serverless Architecture**  
  Leverages AWS Lambda, Glue, Athena, and QuickSight to eliminate infrastructure management.

- **Automated Data Ingestion**  
  Upload `.csv` data and CUR files into S3 buckets to trigger ingestion workflows automatically.

- **ETL Processing with AWS Glue**  
  Extracts, transforms, and loads data into a queryable format with schema inference and data cataloging.

- **SQL-Based Analytics**  
  Uses Amazon Athena to run SQL queries over structured data without provisioning servers.

- **Interactive Dashboards**  
  Amazon QuickSight dashboards visualize podcast performance metrics and AWS cost drivers.

- **Monitoring and Logging**  
  AWS CloudWatch tracks pipeline status and logs function activity for auditing and debugging.

---

## Architecture Overview

Data Sources] --> [Amazon S3] --> [AWS Glue] --> [Amazon Athena] --> [Amazon QuickSight]
|
[CloudWatch Logs]
|
[AWS Lambda (optional triggers)]
## Use Case 1: Podcast Insights Dashboard

### Description
Processes `.csv` podcast data (e.g., episode metadata, listener stats) to extract insights such as listener trends, top-performing episodes, and publishing schedules.

### Workflow
1. Upload `.csv` files to S3 bucket.
2. AWS Glue ETL job transforms data and catalogs it.
3. Athena queries generate metrics.
4. QuickSight visualizes episode performance.

---

## Use Case 2: AWS Cost Monitoring Dashboard

### Description
Analyzes AWS CUR data to understand cloud cost distribution, identify top spenders by service/region, and track monthly trends.

### Workflow
1. CUR reports delivered automatically to S3.
2. AWS Glue processes and partitions the cost data.
3. Athena executes queries to segment and aggregate cost information.
4. Dashboards in QuickSight display KPIs, anomalies, and cost breakdowns.

---

## Technologies Used

- **Amazon S3** – Storage for raw podcast and CUR data.
- **AWS Glue** – ETL jobs for data transformation and cataloging.
- **Amazon Athena** – Serverless SQL querying over S3 data.
- **Amazon QuickSight** – Dashboarding and visualization.
- **AWS Lambda** – Event-driven functions for workflow automation.
- **Amazon CloudWatch** – Monitoring and logging of services.
- **Python, SQL** – Used in Glue scripts and Athena queries.

---

## Benefits

- Fully serverless and cost-effective data pipeline.
- Scales automatically with data volume.
- No infrastructure to manage.
- Real-time and historical analytics.
- Suitable for both operational and financial data insights.

---

## Getting Started

1. Configure S3 buckets for podcast and CUR data.
2. Create AWS Glue crawlers and ETL jobs.
3. Set up Athena tables using Glue Data Catalog.
4. Build and share dashboards in Amazon QuickSight.
5. Optionally use Lambda and CloudWatch for workflow automation and monitoring.

---

## License

This project is for educational and demonstration purposes.
