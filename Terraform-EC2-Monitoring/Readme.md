# EC2 Monitoring on AWS with Terraform

This project provisions a basic AWS environment using Terraform, including:

- A VPC with public subnets
- An EC2 instance with detailed monitoring enabled
- Security groups allowing SSH
- CloudWatch Log Group for VPC Flow Logs
- IAM role and policy to support logging

---

## 🔧 Requirements

- Terraform >= 1.3.0  
- AWS CLI configured (`aws configure`)
- An AWS account with sufficient permissions

---

## 📁 Files Overview

| File                | Description |
|---------------------|-------------|
| `main.tf`           | Core infrastructure: VPC, EC2, IAM, Flow Logs |
| `variables.tf`      | Input variables (region, CIDR, AMI ID, etc.) |
| `terraform.tfvars`  | Variable values specific to this deployment |
| `outputs.tf`        | Outputs like public IP and VPC ID |
| `providers.tf`      | AWS provider configuration |
| `.gitignore`        | Optional: ignores `.terraform/` and `*.tfstate` |

---

## 🚀 Deployment

### 1. Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- AWS CLI configured (`aws configure`)
- Valid AWS credentials

### 2. Initialize and Apply

```bash
terraform init
terraform plan
terraform apply
```
## ⚙️ Configuration

Edit `terraform.tfvars` to set your custom parameters:

```hcl
region          = "us-east-1"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24"]
private_subnets = ["10.0.2.0/24"]
instance_type   = "t3.micro"
ami_id          = "ami-0abcdef1234567890"  # Update with an appropriate AMI for your region
```
## 📊 Monitoring & Observability

- EC2 Monitoring: Detailed monitoring is enabled for EC2 instance metrics with 1-minute granularity.

- VPC Flow Logs: Captures all ingress and egress network traffic metadata for the VPC.

- CloudWatch Logs: Flow logs are streamed into CloudWatch under the log group:
  ```
  /aws/vpc/<vpc-name>/flow-logs
  ```
  ### 🔔 Alerting (Optional)

- Create CloudWatch metric filters to detect specific patterns such as rejected connections, traffic from unexpected sources, or high volumes of traffic.

- Alarms can be added to trigger notifications or automated actions.
  
###  ✅ Outputs

After applying the Terraform configuration, key outputs include:

   - EC2 Instance Public IP (if created in a public subnet)

   - CloudWatch Log Group Name

  -  VPC ID

   - Subnet IDs

### 🔒 Security Notes

    - SSH access is limited by default to specific CIDRs through security group rules.

   - IAM roles and policies are narrowly scoped to allow only the required permissions for VPC Flow Logs and CloudWatch.

   - (Optional) CloudWatch VPC interface endpoints can be added to avoid sending log traffic over the public internet.

👤 Author

Salma Mohamed Kassem
  
