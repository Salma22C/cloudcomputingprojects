# Serverless Visitor Counter for Resume Website

Welcome to my serverless visitor counter project! 🚀

After sharing my resume online, I decided to build a simple yet powerful visitor counter using AWS services to track how many people visit my site. This project helped me learn and apply core serverless concepts and AWS tools.

## Project Overview

- **Frontend hosting:** Static website hosted on **Amazon S3**  
- **Content delivery:** **CloudFront** CDN for fast global access  
- **Backend logic:** **AWS Lambda** function to increment visitor count  
- **Data storage:** **DynamoDB** table to store visitor counts  

Every time someone visits my resume site, the Lambda function triggers and updates the visitor count in DynamoDB — all managed without any servers!

## Features

- Real-time visitor counting with atomic increments  
- Fully serverless and scalable architecture  
- CORS enabled for API access from web clients  
- Simple JSON response from Lambda API Gateway integration  

## Challenges & Learnings

- **Decimal serialization:** DynamoDB returns numbers as `Decimal` objects which aren’t JSON serializable by default. I had to convert them to `int` before returning JSON from Lambda.  
- **CloudFront origin setup:** Configuring CloudFront to use the S3 static website endpoint instead of the bucket URL was crucial to enable proper routing.  
- **Certificate & HTTPS:** Setting up TLS certificates with AWS Certificate Manager and dealing with DNS validation delays was tricky but essential for HTTPS.  
- **IAM permissions:** Fine-tuning Lambda's IAM role to allow DynamoDB access while following least privilege principles.  
- **Testing & Debugging:** Using CloudWatch Logs effectively helped debug Lambda invocation and DynamoDB update issues.  

## How to Use

1. Deploy the S3 bucket with your static website content (like your resume PDF and index.html).  
2. Configure CloudFront distribution with the S3 website endpoint as origin.  
3. Create a DynamoDB table (`visitor-counter`) with primary key `id` (String).  
4. Deploy the Lambda function with the following core code to increment count:  

```python
import json
import boto3
from decimal import Decimal

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('visitor-counter')

def lambda_handler(event, context):
    response = table.update_item(
        Key={'id': 'resume'},
        UpdateExpression='ADD #count :inc',
        ExpressionAttributeNames={'#count': 'count'},
        ExpressionAttributeValues={':inc': 1},
        ReturnValues="UPDATED_NEW"
    )
    count = response['Attributes']['count']
    if isinstance(count, Decimal):
        count = int(count)

    return {
        'statusCode': 200,
        'headers': {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'},
        'body': json.dumps({'visitorCount': count})
    }
```

5. Connect your Lambda function to API Gateway (REST API or HTTP API) to expose the visitor count endpoint.  
6. Call this API from your frontend to display visitor count live.

---


— Salma Kassem  


