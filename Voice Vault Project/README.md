# Voice Vault – Text-to-Speech Automation using AWS S3, Lambda, Polly, and Comprehend

## 📘 Project Overview

Voice Vault is a serverless application that converts `.txt` files stored in Amazon S3 into speech audio using [Amazon Polly](https://aws.amazon.com/polly/), optionally enhanced with summarization from [Amazon Comprehend](https://aws.amazon.com/comprehend/) and SSML formatting. The system uses AWS Lambda triggered by S3 events for automated processing.

---

## 🚀 Key Features

- **Text-to-Speech:** Converts uploaded `.txt` files to `.mp3` using Amazon Polly.
- **Summarization:** Uses Amazon Comprehend to generate concise summaries before converting to audio.
- **Enhanced Speech:** Utilizes SSML for natural speech effects (pauses, emphasis, etc.).
- **Fully Serverless:** Leveraging AWS Lambda and event-based S3 triggers.

---

## 🛠️ Technologies Used

- AWS Lambda
- Amazon S3
- Amazon Polly
- Amazon Comprehend
- AWS IAM
- Python 3.9+
- `boto3` and `botocore` (latest SDKs)

---

## 📋 Prerequisites

- AWS Account with permissions for S3, Lambda, Polly, and Comprehend
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) or Console access
- Python 3.9+ locally or as Lambda runtime

---

## 🧰 Setup Instructions

### 1. 🪣 S3 Bucket Structure
```
Create a bucket (e.g., `voice-vault-bucket`) with: 

notes/ # Upload your notes
.txt files here & audio/ (Lambda will store .mp3 output here)
```

---

### 2. 🔐 IAM Role for Lambda

Create a role with:

- `s3:GetObject`, `s3:PutObject`
- `polly:SynthesizeSpeech`
- `comprehend:DetectSentiment`, `comprehend:DetectKeyPhrases`
- `logs:*` for CloudWatch

---

### 3. Deploy the Lambda Function

- **Runtime**: Python 3.9 or newer
- **Handler**: `lambda_function.lambda_handler`
- **Environment variables**:
  - `BUCKET_NAME`: Your S3 bucket name (e.g., `voice-vault-bucket`)
  - `USE_SUMMARIZATION`: `true` to enable summarization using Comprehend
- **Timeout**: Set to at least 15 seconds

Ensure the deployment package includes the necessary `boto3` client, though it's available by default in the Lambda Python runtime.

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

Upload a `.txt` file into the `notes/` folder. If `USE_SUMMARIZATION=true`, the Lambda function will:

1. Read the file.
2. Summarize the main ideas using **Amazon Comprehend** (English only).
3. Generate audio using **Amazon Polly**.
4. Store the `.mp3` file in the `audio/` folder.

---

### 6. Verify Output

- Navigate to the `audio/` folder in your S3 bucket.
- Download the `.mp3` file and listen to confirm proper summarization and conversion.

---

## 💡 boto3 Clients Used

```python
import boto3

s3 = boto3.client('s3')
polly = boto3.client('polly')
comprehend = boto3.client('comprehend')
```
## ✨ Latest boto3 & AWS SDK Features (v1.34.119)

### 🔊 Amazon Polly

- **Neural TTS Voices**: High-quality voices like `Joanna-Neural`, `Matthew-Neural` for more natural speech.
- **SSML Support**: Accepts `<prosody>`, `<break>`, `<emphasis>`, and `<amazon:effect>` tags for speech tuning.
- **Voice Styles**: Includes expressive voices (e.g., “Newscaster”, “Conversational”) for lifelike narration.  


### 🧠 Amazon Comprehend

- **English-Only NLP**: Key phrase extraction and sentiment detection optimized for English.
- **detect_key_phrases API**: Extracts primary ideas from text in real-time.
- **Lightweight summarization**: Uses top-ranked phrases to represent key content.  


### 🗂️ Amazon S3

- **Prefix & Suffix Event Filtering**: Triggers Lambda functions only when `.txt` files appear in `notes/`.
- **Real-Time Event Triggers**: Seamlessly initiates processing via object creation.  

## 👩‍💻 Author

**Salma Mohamed Kassem**  
📍 Egypt  
🌐 [GitHub](https://github.com/Salma22C) • [LinkedIn](https://linkedin.com/in/salma-mohamed-kassem)
