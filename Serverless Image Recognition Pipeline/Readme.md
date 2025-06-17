# 🖼️ Serverless Image Tagging with Amazon Rekognition

This project implements a fully serverless image recognition pipeline using **AWS Lambda**, **Amazon Rekognition**, and **Amazon S3**. When you upload an image to the `uploads/` folder in S3, the system automatically:

- Detects objects and scenes using Rekognition.
- Saves the results as `.json` metadata in the `metadata/` folder.
- Removes the need for manual image tagging or classification.



## 📌 Use Case

Automatically organize and tag large sets of images using AI. This pipeline helps you generate metadata for indexing, searching, or filtering images without any manual effort.



## 🏗️ Architecture
```
User Upload (S3: uploads/)
↓
[S3 PUT Event Trigger]
↓
AWS Lambda
↓
Amazon Rekognition (DetectLabels)
↓
S3: metadata/ (JSON output)

````

---

## 🪜 Setup Instructions

### 1. Create an S3 Bucket

Create a new S3 bucket with these folders:

- `uploads/`: Place image files here.
- `metadata/`: JSON files with detected labels will be stored here.

> ℹ️ You can create these folders by uploading a test file in each path.



### 2. Create IAM Role for Lambda

Create an IAM role with the following permissions:

- **Amazon Rekognition**: `rekognition:DetectLabels`
- **Amazon S3**: `s3:GetObject`, `s3:PutObject`
- **Logging**: `logs:*` for basic CloudWatch access



## 🚀 Deploy the Lambda Function

- **Runtime**: Python 3.9 or newer  
- **Handler**: `lambda_function.lambda_handler`  
- **Environment Variables**:  
  - `BUCKET_NAME`: Your S3 bucket name (e.g., `image-tagging-bucket`)  
- **Timeout**: At least 15 seconds  
- **Memory**: 128 MB or more  



## ⚡ Set Up S3 Event Trigger

In the S3 bucket:

- Go to **Properties → Event notifications**
- Create a new notification:
  - **Event type**: `PUT` events
  - **Prefix**: `uploads/`
  - **Suffix**: `.jpg`, `.jpeg`, `.png`, etc.
  - **Destination**: Lambda function



## 🧠 How It Works

When an image is uploaded to the `uploads/` folder:

1. **Triggered Lambda** reads the file path.
2. **Amazon Rekognition** is called via `DetectLabels`:
   - Detects labels (e.g., `"Dog"`, `"Pet"`, `"Animal"`)
   - Returns results with confidence scores
3. The label results are saved to a `.json` file in `metadata/`.

Example output path:  
`metadata/cute_dog.jpg.json`



## 📄 Output Notes

- JSON files contain:
  - **Detected labels**
  - **Confidence scores**
  - **Parent categories** (if available)
- These can be used for search, filtering, or enrichment in your app.

---

## 🐾 Label Precision

Rekognition sometimes returns broader labels.  
An image of a **cat** might be labeled as:

- `"Animal"`
- `"Pet"`
- `"Feline"`

…but not `"Cat"` if the confidence score is below the threshold.

### ✅ Tip:
- Lower the confidence threshold (e.g., from 70% to 50%) to catch more specific matches.
- Increase `MaxLabels` if you want to capture more categories.

## 👤 Author

**Salma Mohamed Kassem**  
📍 Egypt  
🌐 [GitHub](https://github.com/Salma22C) • [LinkedIn](https://linkedin.com/in/salma-mohamed-kassem)


