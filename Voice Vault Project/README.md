# Voice Vault - Text to Speech Automation using AWS S3, Lambda, and Polly

## Project Overview

Voice Vault is a serverless application that converts text notes stored in an S3 bucket into speech audio files using AWS Polly. The architecture leverages a single S3 bucket with organized folders, AWS Lambda for processing, and Polly for text-to-speech synthesis.

When a new `.txt` file is uploaded to the `notes/` folder in the S3 bucket, a Lambda function is triggered automatically. It reads the text, converts it to audio (MP3), and stores the audio file in the `audio/` folder of the same bucket.

This project demonstrates:

- Event-driven architecture using S3 event triggers
- Text-to-speech conversion with AWS Polly
- Serverless computing with AWS Lambda
- Efficient resource management using a single S3 bucket and folder prefixes


## Prerequisites

- AWS Account with IAM permissions for S3, Lambda, and Polly
- AWS CLI or AWS Console access
- Python 3.9+ for Lambda runtime
## Setup Instructions

### Step 1: Create an S3 Bucket

Create an S3 bucket (e.g., `voice-vault-bucket`).

### Step 2: Organize Bucket Folders

Create folders in the bucket:

- `notes/` — for uploading `.txt` files (input)
- `audio/` — for storing `.mp3` files (output)

### Step 3: Create IAM Role for Lambda

Create an IAM role with policies to:

- Read and write objects in the S3 bucket
- Access AWS Polly to synthesize speech
- Write CloudWatch logs

Attach this role to the Lambda function.

### Step 4: Create the Lambda Function

- Runtime: Python 3.x
- Handler: `lambda_function.lambda_handler`
- Paste the Lambda code from the project (see below)
- Set environment variables or hardcode bucket name as needed
- Set timeout to 15 seconds

### Step 5: Configure S3 Event Trigger

- In the S3 bucket, go to **Properties → Event notifications**
- Create a new event notification:
  - Event type: **All object create events**
  - Prefix: `notes/`
  - Suffix: `.txt`
  - Destination: your Lambda function

### Step 6: Upload Test Note

Upload a `.txt` file with your note text into the `notes/` folder.

### Step 7: Verify Output

Check the `audio/` folder for the generated `.mp3` file.



## Lambda Code (Python)



