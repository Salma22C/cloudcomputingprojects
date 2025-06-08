# 🖼️ Serverless Image Tagging with Amazon Rekognition

This project implements a fully serverless image recognition pipeline using **AWS Lambda**, **Amazon Rekognition**, and **Amazon S3**. Whenever you upload an image to a specific folder in S3 (`uploads/`), the system automatically:

- Detects objects and scenes using Rekognition.
- Stores detected labels as `.json` metadata in another S3 folder (`metadata/`).
- Removes the need for manual image tagging.

---

## 📌 Use Case

This system helps automatically organize and classify image collections. Instead of manually tagging hundreds of images, you can now automate the entire process and generate searchable metadata using AI.

---

## 🏗️ Architecture

The architecture is simple, efficient, and entirely serverless:

[User Upload] → S3 (uploads/)
↓
[Trigger: S3 PUT Event]
↓
AWS Lambda
↓ (Calls Rekognition DetectLabels)
Amazon Rekognition
↓ (Writes metadata to S3)
S3 (metadata/)
---

## ⚙️ Setup Instructions

### 1. Create an S3 Bucket

Create an S3 bucket with two logical folders:

- `uploads/`: for image uploads that trigger processing.
- `metadata/`: where the generated JSON metadata files will be stored.

You can create these folders by uploading a dummy file to each path.

---

### 2. Create IAM Role for Lambda

Create an IAM role for the Lambda function with permissions to:

- Detect labels using Amazon Rekognition.
- Read images from S3.
- Write metadata files back to S3.
- Write logs to CloudWatch for monitoring and debugging.

---

### 3. Deploy the Lambda Function and Configure Trigger

- Create a Lambda function with the appropriate runtime.
- Attach the IAM role created above.
- Configure the Lambda function to trigger automatically on S3 `PUT` events targeting the `uploads/` folder in your bucket.
- The Lambda function will call Rekognition’s DetectLabels API to analyze each uploaded image and save the label data as a JSON file in the `metadata/` folder.

---

### 🐾 Output Example: Cat Not Explicitly Detected

Sometimes, Rekognition returns broad labels instead of very specific ones. For instance, an image of a cat might be labeled with terms like "Animal," "Mammal," "Pet," and "Feline" rather than explicitly "Cat." This can happen when the confidence score for the specific label is below the set threshold or when the image features are ambiguous.

---

## Tips for Improvement

- Lower the confidence threshold in the Lambda function to get more granular labels.
- Review CloudWatch logs to debug and refine detection.
- Adjust the maximum number of labels returned to capture more or fewer categories.


