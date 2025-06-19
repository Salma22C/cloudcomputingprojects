# EC2 Monitoring with VPC Flow Logs using Terraform

This project provisions a complete AWS infrastructure using Terraform, including a Virtual Private Cloud (VPC), EC2 instances, and VPC Flow Logs for monitoring and observability.

## 🔧 Features

- Custom VPC with public and private subnets
- EC2 instance(s) with detailed monitoring enabled
- Security groups for controlled network access
- VPC Flow Logs sent to CloudWatch Logs
- IAM roles and policies for flow log delivery
- Optional interface VPC endpoint for CloudWatch Logs

---

## 📁 Structure

```
├── main.tf # Includes VPC, EC2, and flow log resources
├── variables.tf # Configurable variables (region, CIDRs, instance type)
├── outputs.tf # Key output values (IP addresses, log group names)
├── terraform.tfvars # Variable values (can be added locally)
└── README.md # Project overview
```

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
  
