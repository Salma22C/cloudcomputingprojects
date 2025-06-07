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

```python
import json
import boto3
import uuid
import logging
from urllib.parse import unquote_plus

logger = logging.getLogger()
logger.setLevel(logging.INFO)

s3_client = boto3.client('s3')
polly_client = boto3.client('polly')

BUCKET = 'voice-vault-bucket'  

def lambda_handler(event, context):
    logger.info(f"Received event: {json.dumps(event)}")

    try:
        for record in event['Records']:
            bucket = record['s3']['bucket']['name']
            key = unquote_plus(record['s3']['object']['key'])

            if bucket != BUCKET or not key.endswith('.txt'):
                logger.info(f"Skipping file: {key} from bucket: {bucket}")
                continue

            logger.info(f"Processing file: {key}")

            obj = s3_client.get_object(Bucket=bucket, Key=key)
            note_text = obj['Body'].read().decode('utf-8')
            logger.info(f"Note text: {note_text[:50]}...")

            response = polly_client.synthesize_speech(
                Text=note_text,
                OutputFormat='mp3',
                VoiceId='Joanna'
            )

            audio_stream = response.get('AudioStream')
            if not audio_stream:
                logger.error("Polly returned no audio stream")
                continue

            base_name = key.split('/')[-1].replace('.txt', '')
            audio_key = f"audio/{base_name}_{uuid.uuid4().hex}.mp3"

            with audio_stream as stream:
                s3_client.upload_fileobj(stream, bucket, audio_key)
            logger.info(f"Uploaded audio file: {audio_key}")

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Processing complete'})
        }

    except Exception as e:
        logger.error(f"Error: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }

