# 🧠 Multilingual Customer Feedback Analyzer (Mentored Project)

## 🎯 Project Purpose

The goal of this project is to create a **serverless system** that can:

- Accept customer feedback in any language via a public API
- Translate the message to English using **Amazon Translate**
- Detect the sentiment using **Amazon Comprehend**
- Store the feedback and metadata in **DynamoDB**
- Send an email alert using **SNS** if the sentiment is negative

---

## 🧱 Architecture
```
User
↓
API Gateway (POST /feedback)
↓
AWS Lambda
├── Translate: Original → English
├── Comprehend: Sentiment + Entities
├── DynamoDB: Store message
└── SNS: Alert if sentiment is NEGATIVE
```

---

## 🛠️ AWS Services Used

- API Gateway  
- Lambda  
- Amazon Translate  
- Amazon Comprehend  
- Amazon DynamoDB  
- Amazon SNS  
- CloudWatch (for logs)

---

## 🔧 Skills Practiced

- Serverless workflows  
- Using AI/ML services in real apps  
- IAM permissions and Lambda environment variables  
- API design and testing  
- Logging and debugging via CloudWatch  
- Database integration (NoSQL)

---

## 🙌 Acknowledgment

I’m still growing in my AWS and cloud journey, but mentoring and helping others on this project was a great experience. It pushed me to learn deeper and understand not just how, but **why** these services work together.

---

## 🧪 Sample Test

```bash
POST /feedback

{
  "name": "Carlos",
  "language": "es",
  "message": "El producto no funciona bien."
}

