# AWS Text Summarization & Speech Synthesis

This project demonstrates an AWS Lambda function triggered by S3 text file uploads that:

- Reads and processes text files from S3  
- Uses AWS Comprehend to detect language and extract key phrases  
- Summarizes key phrases into a concise text summary  
- Converts the summary into speech with AWS Polly  
- Saves the summary text and audio back to an S3 bucket  

## Features

- Serverless architecture  
- Automated pipeline with S3 event triggers  
- Multi-service integration: S3, Lambda, Comprehend, Polly  
- Handles AWS API limits and error handling  

## How to Use

1. Upload `.txt` files to your input S3 bucket  
2. Lambda function triggers automatically  
3. Check `output/` folder for summary text and MP3 audio files  

## Prerequisites

- IAM Role with S3, Comprehend, and Polly access  

---


