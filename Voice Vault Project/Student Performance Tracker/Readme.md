# ✅ PoC: Student Performance Tracker using AWS Serverless Stack

## 📌 Objective

Create a lightweight, serverless backend for submitting and storing student performance data using AWS. This project is designed for training, prototyping, and resume-ready demos.



## 🛠️ Architecture Overview

```
[Client (curl / Postman)]
↓
[API Gateway]
↓
[AWS Lambda (Python)]
↓
[DynamoDB: PerformanceTable]
↓
[CloudWatch Logs]
```

- **Client**: Sends performance data via HTTP POST
- **API Gateway**: Routes request
- **Lambda (Python)**: Handles logic (validation, remarks)
- **DynamoDB**: Stores student records
- **CloudWatch**: Logs for debugging/observability



## 🔄 Data Flow

1. **Client Input** (HTTP POST):
```json
{
  "studentId": "S101",
  "course": "AWS Cloud",
  "score": 88
}
```
## Lambda Function:

    - Adds timestamp if missing
    - Calculates Pass/Fail using score
    - Writes entry to PerformanceTable in DynamoDB
## Response
```
{
  "message": "Performance saved.",
  "data": {
    "studentId": "S101",
    "course": "AWS Cloud",
    "score": 88,
    "date": "2025-07-09",
    "remarks": "Pass"
  }
}
```


 ## Use Cases
- Academic dashboards
- Teacher tools
- Student result apps
- Serverless PoC & training
   
### Author 
Salma Kassem
