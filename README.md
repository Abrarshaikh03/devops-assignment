# 📘 DevOps Assignment – Private EC2 Behind ALB Using Terraform

This repository delivers a complete AWS infrastructure built using **Terraform**, hosting a Python application running on **private EC2 instances** behind an **Application Load Balancer (ALLB)**.  
The design demonstrates production-grade VPC architecture, Auto Scaling, IAM roles, and Infrastructure-as-Code best practices.

---

# 🏗️ Architecture Overview

### Components deployed:

- **VPC (10.0.0.0/16)**
  - 2× Public Subnets  
  - 2× Private Subnets  
- **Internet Gateway**
- **Public Route Table**
- **NAT Gateway + Elastic IP**
- **Application Load Balancer**
  - Listener on **80 → 8080**
  - Target Group with health check `/health`
- **Auto Scaling Group**
- **Launch Template**
- **IAM Role + Instance Profile**
- **EC2 Instances in private subnets only**
- **User Data** installs Python app on startup

The deployed app returns:

```
Hello from Private EC2 behind ALB!
```

---

# 📁 Repository Structure

```
devops-assignment/
│
├── app/
│   └── main.py
│
├── scripts/
│   ├── deploy.sh
│   ├── destroy.sh
│   └── test.sh
│
├── terraform/
│   ├── vpc.tf
│   ├── alb-sg.tf
│   ├── sg.tf
│   ├── iam.tf
│   ├── userdata.sh
│   ├── outputs.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── .terraform.lock.hcl
│
├── screenshots/
│
├── .gitignore
└── README.md
```

---

# 🚀 1. Prerequisites

Before deploying:

### Install:
- Terraform  
- AWS CLI  
- Python3  
- Git  

### Configure AWS:
```
aws configure
```

Required IAM permissions:
- AdministratorAccess  

---

# 🚀 2. Deploy Infrastructure

### Clone repo:
```
git clone https://github.com/Abrarshaikh03/devops-assignment.git
cd devops-assignment/terraform
```

### Initialize:
```
terraform init
```

### Validate:
```
terraform validate
```

### Plan:
```
terraform plan
```

### Apply:
```
terraform apply
```

Enter **yes** when prompted.

---

# 🌍 3. Get ALB DNS

```
terraform output alb_dns
```

---

# 🌐 4. Test Application

Replace `<ALB-DNS>`:

```
curl http://<ALB-DNS>; echo
```

Expected:
```
Hello from Private EC2 behind ALB!
```

---

# 🧹 5. Destroy Infrastructure

```
terraform destroy
```

Enter **yes**.

---

# 🧪 6. Validate Resources Destroyed

Check Terraform state:
```
terraform state list
```
Expect:
```
(no resources found)
```
---

# 📸 7. Screenshots Included

Inside `screenshots/`:

- ALB Listener and Rules
- VPC subnets
- Target Group  
- Private EC2 instances  
- Health check  
- Working curl result output

---

# 🎯 Final Result

A complete, production-style AWS environment built using Terraform, demonstrating:

- AWS networking fundamentals  
- Infrastructure as Code  
- Load balancers & target groups  
- Private subnets + NAT routing  
- Auto Scaling concepts  
- IAM role/instance profile setup  
- Automated app deployment  
