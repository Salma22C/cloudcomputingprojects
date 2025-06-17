# 🤖 Ask HR Bot – Generative AI Chatbot using Amazon Bedrock (PoC)

**Ask HR Bot** is a proof-of-concept chatbot built using **Amazon Bedrock Knowledge Base**. It allows users to ask natural language questions about company HR policies, retrieving accurate answers from internal documents — without writing code or training models.



## 🔍 What It Does

This project demonstrates a **Retrieval-Augmented Generation (RAG)** application using:
- Amazon S3 (document storage)
- Titan Embeddings (text vectorization)
- OpenSearch Serverless (vector store)
- Bedrock Knowledge Base (RAG orchestration)
- Claude/Mistral LLM (answer generation)

📂 Example use case: Ask about PTO, work hours, or benefits from a company's employee handbook.

### System Architecture Diagram 
```
┌────────────┐      ┌─────────────┐       ┌────────────┐
│  User Q&A  │──▶──▶│  Bedrock KB │──▶──▶│ Claude/Mistral │
└────────────┘      └─────────────┘       └────────────┘
      │                      ▲
      ▼                      │
  Amazon S3 (HR docs)    OpenSearch (vector DB)
```

## 💡 Use Case

**Human Resources Chatbot**  
Employees can ask questions like:
- “How many PTO days do we get?”
- “Is remote work allowed?”
- “What are the company’s working hours?”

---

## 🧰 Tech Stack

| Component         | Technology                    |
|------------------|-------------------------------|
| Document Storage | Amazon S3                     |
| Embedding Model  | Amazon Titan Embeddings G1    |
| Vector Store     | Amazon OpenSearch Serverless  |
| LLM              | Claude / Mistral via Bedrock  |
| RAG Orchestration| Amazon Bedrock Knowledge Base |

---

## 🛠️ Setup Steps

### 1. Prepare HR Documents
Upload `.txt` files like:
- `employee_handbook.txt`
- `pto_policy.txt`
- `benefits_summary.txt`

To: **Amazon S3 bucket** (e.g., `ask-hr-bot-docs`)

### 2. Create a Knowledge Base
- Use **Amazon Bedrock**
- Select **Titan Embeddings G1**
- Choose **OpenSearch Serverless**
- Sync data source (S3 bucket)

### 3. Test in Console
Use the built-in chat interface to ask HR-related questions.

---

## 📸 Demo

![Ask HR Bot Chat Screenshot](./chat-demo.png)

> Screenshot of Bedrock test chat interface


## 🚀 Why This PoC Matters

✅ No fine-tuning or model training  
✅ Uses your real documents  
✅ Shows how businesses can build AI-powered internal tools in minutes





