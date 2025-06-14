# Voice Vault – Text-to-Speech Automation using AWS S3, Lambda, Polly, and Comprehend

[**GitHub Repository**](https://github.com/Salma22C/awsprojects/tree/main/Voice%20Vault%20Project)

## Project Overview

Voice Vault is a serverless application that automatically converts text files stored in an Amazon S3 bucket into speech audio files using Amazon Polly. It also supports optional text summarization via Amazon Comprehend and enhanced voice output using SSML (Speech Synthesis Markup Language). The solution uses an event-driven architecture and a single S3 bucket with organized folder prefixes.

### Key Features

- **Version 1:** Converts `.txt` files to `.mp3` using Amazon Polly via an AWS Lambda function triggered by S3 uploads.
- **Version 2:** Enhances output with summarization using Amazon Comprehend and SSML formatting for improved audio experience.

### Technologies Used

- [AWS Lambda]
- [Amazon Polly]
- [Amazon Comprehend]
- [Amazon S3]
- [AWS IAM]
- Python 3.9+

---

## Prerequisites

- An AWS Account with IAM permissions for S3, Lambda, Polly, and Comprehend
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) or AWS Console access
- Python 3.9+ for local development or Lambda runtime

---

## Setup Instructions

### 1. Create and Organize the S3 Bucket

Create a new S3 bucket (e.g., `voice-vault-bucket`) and add the following folders:

- `notes/` — Upload `.txt` files here (input)
- `audio/` — Lambda stores `.mp3` outputs here (output)



---

### 2. Create IAM Role for Lambda

Create an IAM role with the following permissions:

- **S3**: `s3:GetObject`, `s3:PutObject`
- **Polly**: `polly:SynthesizeSpeech`
- **Comprehend** *(if using summarization)*: `comprehend:DetectSentiment`, `comprehend:DetectKeyPhrases`
- **Logging**: `logs:CreateLogGroup`, `logs:CreateLogStream`, `logs:PutLogEvents`


---

### 3. Deploy the Lambda Function

- **Runtime**: Python 3.9 or 3.x
- **Handler**: `lambda_function.lambda_handler`
- Set required environment variables (e.g., `BUCKET_NAME`)
- Set timeout to at least 15 seconds



---

### 4. Set Up S3 Event Trigger

In your S3 bucket:

- Go to **Properties → Event notifications**
- Add a new notification:
  - **Event type**: All object create events
  - **Prefix**: `notes/`
  - **Suffix**: `.txt`
  - **Destination**: Your Lambda function



---

### 5. Upload a Test File

Upload a `.txt` file into the `notes/` folder. The Lambda function will:

1. Read the file.
2. (Optional) Summarize using Comprehend.
3. Generate SSML-enhanced speech using Polly.
4. Save the output `.mp3` file into the `audio/` folder.

---

### 6. Verify Output

- Open the S3 `audio/` folder
- Download and play the `.mp3` file to confirm successful processing

---


