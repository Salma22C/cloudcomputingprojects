# Automated S3 File Copy Using AWS Lambda

## Project Overview

This project automates the copying of files from one Amazon S3 bucket to another using an AWS Lambda function triggered by S3 object creation events. It enables seamless and real-time replication of files without manual intervention, leveraging AWS serverless services.

## Features

- Automatically copies files uploaded to a source S3 bucket to a destination S3 bucket
- Uses AWS Lambda with Python runtime
- Employs IAM roles with least privilege access for secure operations
- Configurable destination bucket via Lambda environment variables
- Integration with CloudWatch for monitoring and troubleshooting

## Prerequisites

- AWS Account with permissions to create/manage S3, Lambda, and IAM resources
- AWS CLI or AWS Console access
- Python 3.x runtime (for Lambda function)

## Setup Instructions

### Step 1: Create S3 Buckets

1. Create two S3 buckets (e.g., `source-bucket` and `destination-bucket`) in your AWS account.

### Step 2: Create IAM Role for Lambda

1. Navigate to IAM → Roles → Create Role
2. Select AWS service → Lambda
3. Attach policies:
   - `AmazonS3ReadOnlyAccess` (for reading source bucket)
   - `AmazonS3FullAccess` or a custom policy with write permission to the destination bucket
4. Name the role (e.g., `LambdaS3CopyRole`) and create it.

### Step 3: Create Lambda Function

1. Go to AWS Lambda → Create function → Author from scratch
2. Function name: e.g., `S3CopyFunction`
3. Runtime: Python 3.x
4. Permissions: Assign the IAM role created earlier

### Step 4: Add S3 Trigger

1. In Lambda configuration, add a trigger for the source S3 bucket
2. Event type: All object create events

### Step 5: Add Lambda Function Code

### Step 6: Testing

1. **Upload Test File**:
   - Upload a sample file (e.g., `test.txt`) to your source S3 bucket
   - Verify the file appears in your destination bucket within seconds

2. **Verify Logs**:
   - Check CloudWatch Logs for your Lambda function
   - Look for execution logs confirming the copy operation
   - Check for any error messages if the copy failed

3. **Different File Types**:
   - Test with various file types (images, documents, archives)
   - Verify all file types are copied correctly
