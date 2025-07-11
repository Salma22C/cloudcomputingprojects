# 📺YouTube Watch Later Analytics

## Project Overview  
This project builds an AWS data pipeline to analyze YouTube Watch Later videos. It ingests CSV data stored in S3, uses Athena to query and explore the data, and integrates with QuickSight (in progress) to visualize user engagement trends.

## Architecture  
- **S3:** Stores the raw YouTube Watch Later CSV files.  
- **Athena:** Runs SQL queries on the CSV data directly from S3, enabling data exploration without ETL.  
- **QuickSight:** (In progress) Visualizes key metrics such as video counts over time and playlist activity.

## Setup Instructions  
1. Upload your YouTube Watch Later CSV file(s) to the configured S3 bucket path (e.g., `s3://youtube-history-pipeline/input/`).  
2. Create or update Athena external table pointing to the S3 path.  
3. Run Athena queries to explore the data.  
4. (Upcoming) Connect QuickSight to Athena for visualization.

## Sample Athena Query  
```sql
SELECT video_id, playlist_video_creation_timestamp  
FROM my_youtube_db.watch_later_videos  
LIMIT 10;
```
### Future Work

    Develop QuickSight dashboards for actionable insights.
    Automate ingestion and table updates.
