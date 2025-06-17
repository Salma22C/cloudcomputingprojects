# 🛡️ High Availability and Security for PHP Applications

This project showcases how to deploy a secure and highly available PHP web application on AWS using **only the AWS Console**. The architecture uses Amazon EC2, RDS, Application Load Balancer (ALB), and Auto Scaling Groups (ASG) to ensure performance, fault tolerance, and security.

---

## 📌 Project Overview

- **High Availability**: Traffic is balanced across multiple EC2 instances in different Availability Zones.
- **Security**: Network isolation with Security Groups, IAM roles, and encrypted connections to the database.
- **Managed Scalability**: Auto Scaling handles traffic spikes and recovers from instance failures.

## 📊 Architecture Diagram

This diagram illustrates the deployment of a highly available and secure PHP application using AWS Console resources.

![High Availability and Security Architecture](b8d25b4b-ccef-42ad-88f3-4978b023e7ae.png)

**Key Features:**
- **Auto Scaling Group** spans across **two Availability Zones** for fault tolerance
- **Public Subnets** host the Application Load Balancer
- **Private Subnets** securely host EC2 instances and RDS
- **Internet Gateway** allows public access to the load balancer only
- **RDS Multi-AZ deployment** with automatic failover for high availability


## 🛠️ AWS Services Used

| Service         | Purpose                                  |
|-----------------|-------------------------------------------|
| **EC2**         | Hosts the PHP application                |
| **ALB**         | Balances traffic across instances        |
| **Auto Scaling**| Automatically adds/removes EC2 instances |
| **RDS**         | MySQL database for backend storage       |
| **IAM**         | Access control for EC2 instances         |
| **Security Groups** | Firewall rules for traffic control |



## 🚀 Step-by-Step Setup (AWS Console)

### 1. **Launch RDS Instance**
- Create a **MySQL RDS** instance in a **private subnet**
- Enable **Multi-AZ deployment** for high availability
- Configure credentials and set inbound rules to accept traffic from EC2 security group

### 2. **Create Security Groups**
- One SG for **EC2** (allow HTTP/HTTPS from ALB and MySQL to RDS)
- One SG for **ALB** (allow HTTP/HTTPS from the internet)
- One SG for **RDS** (allow MySQL traffic from EC2 SG only)

### 3. **Create EC2 Launch Template**
- Amazon Linux or Ubuntu AMI with Apache and PHP installed
- User data script to deploy your PHP code
- Attach IAM role for secure access to logs or RDS if needed

### 4. **Create Auto Scaling Group**
- Attach Launch Template
- Distribute instances across **at least 2 AZs**
- Configure scaling policies based on CPU utilization or traffic

### 5. **Create Application Load Balancer**
- Link to public subnets
- Register target group with EC2 instances (via ASG)
- Add listener rules for HTTP/HTTPS (optionally use SSL via ACM)



## 🔐 Security Best Practices

- ✅ EC2 and RDS are in **separate subnets** (public/private)
- ✅ Access to RDS is **limited to EC2 security group**
- ✅ Use **IAM roles** instead of hardcoded credentials
- ✅ Use **SSL/TLS** for encrypting HTTP traffic (optional via ACM)



## 🧰 Tools & Technologies

- 🟧 Amazon EC2, ALB, ASG, RDS
- 🐘 PHP & Apache on Amazon Linux 
- 🔐 IAM Roles, Security Groups




## 👩‍💻 Author

**Salma Mohamed Kassem**  
🔗 [LinkedIn](https://www.linkedin.com/in/salma-mohamed-kassem) | 📧 [Email](mailto:salmakassem6@gmail.com)
