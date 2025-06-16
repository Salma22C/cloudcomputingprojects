# 🌐 Static Website Hosting on AWS with Terraform

This project automates the deployment of a static website on AWS using **Terraform** and **Amazon S3**. It provisions the infrastructure, sets public access, and uploads site content like `index.html`.

---

## 📦 Features

- Creates and configures an S3 bucket for static website hosting
- Sets the appropriate bucket policy for public read access
- Uploads static files to the bucket (e.g., HTML, CSS, images)
- Defines `index.html` and `error.html` for site behavior
- Outputs a live S3 website URL

---

## 🛠️ Technologies Used

- Terraform (IaC)
- AWS S3 (Static Website Hosting)
- AWS IAM (Policy for public access)
- AWS CLI (for file uploads – optional)

---

## 🧰 Prerequisites

Make sure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- AWS Account with access credentials (`aws configure`)

---

## 📁 Project Structure
terraform-static-website/
├── main.tf # Terraform infrastructure config
├── variables.tf # Input variables (e.g., bucket name)
├── outputs.tf # Outputs (e.g., website URL)
├── index.html # Sample static site content
├── error.html # Error page (optional)


---

## 🚀 Step-by-Step Deployment Guide

### ✅ Step 1: Clone the Repository
git clone https://github.com/your-username/terraform-static-website.git
cd terraform-static-website
### ✅ Step 2: Initialize Terraform
terraform init
### ✅ Step 3: Preview Changes
Always inspect the plan before applying.
terraform plan
### ✅Step 4: Deploy Infrastructure
This creates the S3 bucket and applies policies.
terraform apply

### ✅  Step 5: Upload Website Files (Optional if not automated)

If your files aren’t auto-uploaded with Terraform, use AWS CLI:
aws s3 cp index.html s3://your-bucket-name/index.html --acl public-read
aws s3 cp error.html s3://your-bucket-name/error.html --acl public-read
### ✅ Step 6: Access Your Website
After Terraform runs, it will display the website endpoint:
Outputs:
website_endpoint = http://your-bucket-name.s3-website-region.amazonaws.com
Open it in a browser to see your static site.
🧹 Tear Down (Destroy Resources)

To avoid ongoing charges or clutter, you can destroy the infrastructure:
terraform destroy

## 🔒 Security Notes

- This configuration grants **public read access** to the S3 bucket, which is suitable only for hosting static, non-sensitive content.
- **Do not use** this setup to store private data or handle secure applications.
- For production use, consider adding CloudFront, HTTPS, and access control via IAM, OAI (Origin Access Identity), or signed URLs.

---

## 👤 Author

**Salma Mohamed Kassem**  
📍 Egypt  
🌐 [GitHub](https://github.com/Salma22C) • [LinkedIn](https://linkedin.com/in/salma-mohamed-kassem)
