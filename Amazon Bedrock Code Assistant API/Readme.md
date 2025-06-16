# Amazon Bedrock Code Assistant API

This project demonstrates a serverless API built on AWS that leverages Amazon Bedrock foundation models (Anthropic Claude Instant) to generate intelligent code assistant responses based on user prompts.

## Features

- AWS Lambda function that integrates with Amazon Bedrock Runtime API  
- HTTP API Gateway endpoint to receive user prompts and return generated responses  
- Input validation and prompt size limits for cost control  
- Error handling with informative messages  

## Technologies Used

- AWS Lambda  
- Amazon API Gateway (HTTP API)  
- Amazon Bedrock (Anthropic Claude Instant foundation model)  
- Python (boto3 SDK)

## How It Works

Users send POST requests with a JSON body containing a prompt. The Lambda function calls the Bedrock model with the prompt and returns the model-generated completion as the response.

## Usage

Send a POST request to the API Gateway endpoint with JSON:

```json
{
  "prompt": "Explain how Amazon EC2 works."
}
