# 🖼️ Serverless Image Tagging with Amazon Rekognition

This project implements a fully serverless image recognition pipeline using **AWS Lambda**, **Amazon Rekognition**, and **Amazon S3**. Whenever you upload an image to a specific folder in S3 (`uploads/`), the system automatically:

- Detects objects and scenes using Rekognition
- Stores detected labels as `.json` metadata in another S3 folder (`metadata/`)
- Removes the need for manual image tagging

---

## 📌 Use Case

This system helps automatically organize and classify image collections. Instead of manually tagging hundreds of images, you can now automate the entire process and generate searchable metadata using AI.

---

## 🏗️ Architecture

[User Upload] → S3 (uploads/)
↓
[Trigger: S3 PUT Event]
↓
AWS Lambda
- Calls Rekognition DetectLabels
- Writes metadata to S3 (metadata/)
  
---

## ⚙️ Setup Instructions

### 1. Create an S3 Bucket

Create an S3 bucket with two logical folders:

- `uploads/`: where you upload images
- `metadata/`: where metadata files (JSON) will be stored

You can create these folders by uploading a dummy file to each.

---

### 2. Create IAM Role for Lambda

Create an IAM role with this inline policy (or attach equivalent managed permissions):

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "rekognition:DetectLabels",
        "s3:GetObject",
        "s3:PutObject",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
### 3. Deploy the Lambda Function
### 4. Add S3 Trigger to Lambda

In the AWS Lambda Console:

    Go to Configuration → Triggers

    Add a new trigger:

        Source: S3

        Bucket: your bucket name

        Event type: PUT

        Prefix: uploads/

        Suffix: (leave blank)

Save the trigger.
###🐾 Output: Cat Not Explicitly Detected

Sometimes, Rekognition may only return general labels. For example:
{
  "Labels": [
    {
      "Name": "Animal",
      "Confidence": 98.2
    },
    {
      "Name": "Mammal",
      "Confidence": 95.7
    },
    {
      "Name": "Pet",
      "Confidence": 91.4
    },
    {
      "Name": "Feline",
      "Confidence": 65.3
    }
  ]
}


