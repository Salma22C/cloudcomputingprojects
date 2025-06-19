# EC2 Monitoring on AWS with Terraform

This project provisions a basic AWS environment using Terraform, including:

- A VPC with public and private subnets
- An EC2 instance with detailed monitoring enabled
- Security groups allowing SSH
- CloudWatch Log Group for VPC Flow Logs
- IAM role and policy to support logging

---

## 🔧 Requirements

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0  
- AWS CLI configured (`aws configure`)
- An AWS account with sufficient permissions

---

## 📁 Files Overview
```
| File                | Description |
|---------------------|-------------|
| `main.tf`           | Core infrastructure: VPC, EC2, IAM, Flow Logs |
| `variables.tf`      | Input variables (region, CIDR, AMI ID, etc.) |
| `terraform.tfvars`  | Variable values specific to this deployment |
| `outputs.tf`        | Outputs like public IP and VPC ID |
| `providers.tf`      | AWS provider configuration |
| `.gitignore`        | Optional: ignores `.terraform/` and `*.tfstate` |
```

###  🚀 Deployment

 1. Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0
- AWS CLI configured (`aws configure`)
- Valid AWS credentials

2. Initialize and Apply

```bash
terraform init
terraform plan
terraform apply
```
### ⚙️ Configuration

Edit terraform.tfvars to set your custom parameters:
```
region          = "us-east-1"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24"]
private_subnets = ["10.0.2.0/24"]
instance_type   = "t2.micro"
ami_id          = "ami-0abcdef1234567890"  # Update with an appropriate AMI for your region
```

### 📊 Monitoring & Observability

   - EC2 Monitoring: Enabled with 1-minute detailed CloudWatch metrics

   - VPC Flow Logs: Captures metadata for all network traffic in the VPC

   - CloudWatch Logs: Flow logs are streamed to the log group:
```
/aws/vpc/<vpc-id>/flow-logs
```
### 🧠 Challenges Faced

    - Terraform Syntax & Structure
    Learned how to structure files (main.tf, variables.tf, etc.) and fix syntax issues like unsupported arguments.

   - Provider Conflicts
    Faced issues defining the AWS provider multiple times without aliases.

   - Incorrect Resource References
    Debugged errors using for_each and accessing map elements properly (e.g., each.key instead of index [0]).

   - Security Best Practices
    Understood the importance of CIDR ranges, IAM scoping, and enabling logging/monitoring.

  -  CloudWatch & Flow Logs
    Learned how logs are streamed into CloudWatch and how to access log groups.

   - Terraform Dependencies
    Understood Terraform’s automatic dependency graph and when to use depends_on explicitly.



### 🎯 Learning Outcomes

- Provisioned AWS infrastructure using Terraform

- Built networking components: VPC, subnets, route tables

- Enabled CloudWatch monitoring for EC2 and VPC

- Understood the concept of infrastructure as code (IaC)

- Improved debugging skills with Terraform CLI and AWS Docs




### ✅ Outputs

After running terraform apply, the following will be output:

   - EC2 Instance Public IP (only in public subnets)

   - CloudWatch Log Group Name

    -VPC ID

   - Public and Private Subnet IDs

### 🔒 Security Notes

    - SSH access is restricted to specific CIDRs via security group rules

   - IAM roles are scoped with least-privilege permissions for:

      -  VPC Flow Logs

     -   CloudWatch logging

👤 Author

Salma Mohamed Kassem
