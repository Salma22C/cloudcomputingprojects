# 🎧 Podcast Insights Dashboard

A serverless AWS project that turns structured podcast metadata (CSV) into a dynamic analytics dashboard. Built for beginners learning data engineering with AWS tools.


## 📁 Sample Data

Includes podcast metadata with:
- Timestamp
- Title
- Host
- Duration (in seconds)
- Topic
- Tags
- Sentiment (manual )
## ⚙️ Stack
| Tool                           | Purpose                              |
| ------------------------------ | ------------------------------------ |
| **Amazon S3**                  | Store raw podcast CSV data           |
| **AWS Glue**                   | Crawl data and define table schema   |
| **Athena**                     | Query data using SQL                 |
| **QuickSight**                 | Build interactive dashboards         |


Example:

```csv
Timestamp,Title,Host,Duration (sec),Topic,Tags,Sentiment
2025-06-01 09:00,The Future of AI,"Lex Fridman",5400,AI,"AI,Future,Technology",Neutral
2025-06-02 18:30,How to Build Wealth,"Naval Ravikant",4200,Personal Finance,"Wealth,Investing,Philosophy",Positive
2025-06-03 07:15,Why We Sleep,"Andrew Huberman",3600,Health,"Sleep,Neuroscience",Positive

...
