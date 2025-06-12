# AWS Text Summarization & Speech Synthesis Pipeline

## Overview

This serverless project automatically processes text files uploaded to an S3 bucket by summarizing key phrases using Amazon Comprehend and converting the summary to speech using Amazon Polly. The summarized text and audio are saved back to the S3 bucket.

## Architecture

- **S3**: Triggers Lambda on new `.txt` file upload  
- **AWS Lambda**: Orchestrates processing  
- **Amazon Comprehend**: Detects dominant language and key phrases  
- **Amazon Polly**: Synthesizes speech from the summary  
- **S3**: Stores output summary and audio  

## Features

- Automatic event-driven processing  
- Handles large text by chunking  
- Top 10 key phrases summary  
- MP3 audio output  
- Robust error handling and logging  

## Setup Instructions

1. Create S3 buckets for input and output.  
2. Configure Lambda with appropriate IAM role (S3, Comprehend, Polly permissions).  
3. Add S3 event trigger to Lambda for `.txt` files.  
4. Deploy Lambda function code.  
5. Upload `.txt` files to input bucket to trigger processing.

## Usage

Upload your UTF-8 encoded text file to the input S3 bucket. The summarized text and audio will appear in the output folder.


