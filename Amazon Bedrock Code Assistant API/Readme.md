# 🤖 Amazon Bedrock Code Assistant API

This project demonstrates a fully serverless API powered by **Amazon Bedrock** and **Anthropic Claude Instant**, designed to function as an intelligent code assistant. It processes user-submitted prompts and returns natural language responses via a simple HTTP API.



## 🚀 Features

- Serverless **AWS Lambda** function integrated with **Amazon Bedrock Runtime API**
- **API Gateway** (HTTP API) for receiving POST requests
- **Prompt validation** and basic size limits for budget and safety
- Structured **error handling** with useful feedback
- Designed for code-related queries, summaries, or explanations



## 🧱 Technologies Used

- AWS Lambda (Python 3.9+)
- Amazon API Gateway (HTTP API)
- Amazon Bedrock (Anthropic Claude Instant model)
- IAM with least privilege
- Python `boto3` SDK for Bedrock



## ⚙️ How It Works

1. A user sends a `POST` request to the API Gateway endpoint with a prompt.
2. The Lambda function validates the request.
3. The prompt is passed to **Amazon Bedrock** using the `InvokeModel` API.
4. The model (Claude Instant) generates a completion.
5. The Lambda function formats and returns the response.

---

## 📥 Sample Input (JSON Body)

```json
{
  "prompt": "Explain how Amazon EC2 works."
}
{
  "prompt": "Explain the main features and use cases of Amazon API Gateway."
}
```

## 📤 Sample Output

```json
{
  "response": "Amazon EC2 (Elastic Compute Cloud) is a web service that provides resizable compute capacity in the cloud..."
}

```


## 🛠️ Deployment Notes

### Deploy the Lambda Function

- **Runtime**: Python 3.9 or newer  
- **Handler**: `lambda_function.lambda_handler`  
- **Environment Variables**:
  - `BEDROCK_MODEL_ID`: e.g., `anthropic.claude-instant-v1`
  - `REGION`: your AWS region (e.g., `us-east-1`)
- **Timeout**: At least 10 seconds  
- **Memory**: 256 MB recommended



### IAM Permissions for Lambda

Ensure the Lambda role includes:

- `bedrock:InvokeModel` – to access Amazon Bedrock models
- `logs:CreateLogGroup`, `logs:CreateLogStream`, `logs:PutLogEvents` – for CloudWatch logging


### Set Up API Gateway

- **Type**: HTTP API  
- **Method**: `POST`  
- **Integration**: Lambda Proxy  
- **CORS**: Enable if integrating with a frontend or JavaScript client

## 🔐 Input Safety

- Validate the prompt in the Lambda code
- Reject requests with missing or oversized prompts (e.g., > 2000 characters)
- Return informative error messages using standard HTTP status codes

## 🧪 Testing

Test the deployed API using **AWS CloudShell** or any local terminal:

```bash
curl -X POST https://your-api-id.execute-api.region.amazonaws.com/ \
  -H "Content-Type: application/json" \
  -d '{"prompt": "Summarize the AWS Well-Architected Framework."}'
```


## 👤 Author

**Salma Mohamed Kassem**  
📍 Egypt  
🌐 [GitHub](https://github.com/Salma22C) • [LinkedIn](https://linkedin.com/in/salma-mohamed-kassem)

