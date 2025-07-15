# 🧠 Resume Ranker – Intelligent Resume Screening with AWS

## 📌 Overview

This project automates resume analysis and scoring using AWS services. It uses **Amazon Comprehend** to extract key phrases from resumes uploaded to **Amazon S3**, and processes them using **AWS Lambda**. Optionally, it stores scores in **DynamoDB** for further analysis.


## 🛠️ Tech Stack

- **AWS Lambda** (Python 3.12)
- **Amazon S3**
- **Amazon Comprehend**
- **Amazon DynamoDB** 
- **IAM**

## 🧰 Architecture

```text
[Upload Resume (TXT/PDF)] 
         ↓
[Amazon S3 Bucket]
      ↓ Trigger
 [AWS Lambda Function]
         ↓
[Amazon Comprehend NLP]
         ↓
[Relevance Scoring]
         ↓
[DynamoDB Storage]
```
# 🎯 Features

- Detects key phrases in resumes using **Amazon Comprehend**
- Matches extracted phrases against a list of job-specific keywords
- Scores resumes automatically and logs the results
- Stores resume metadata and score in **DynamoDB** for filtering or querying

---

# 🚀 How It Works

1. User uploads a `.txt` resume to an **S3 bucket**
2. The upload triggers an **AWS Lambda** function
3. Lambda reads the resume and sends its content to **Amazon Comprehend**
4. Comprehend extracts key phrases from the resume
5. Lambda compares the key phrases against predefined keywords
6. A relevance score is calculated (e.g., `3 / 5`) and logged
7. Results are written to **DynamoDB** for further analysis or retrieval


# 📌 Challenges & Solutions

- Comprehend's Output is Key Phrase-Based, Not Word-Based
Problem:
Amazon Comprehend returns key phrases, not individual tokens. So, exact matching like this:
```
score = sum([1 for keyword in target_keywords if keyword in phrases])
```
it only scores a match if a keyword exactly equals a full phrase

✅ Sample Output
```
Resume: resume1.txt | Score: 4 / 5
```
Result:
Resume with several relevant skills gets a score of only 1 instead of 4+

✅ Solution:
Use partial matching – check if each keyword appears within any key phrase:
```
score = sum(
    1 for keyword in target_keywords
    if any(keyword in phrase for phrase in phrases)
)
```
This way, "aws" will match "AWS Lambda" and "Certified AWS Developer".

