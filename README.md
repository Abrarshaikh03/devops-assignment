# DevOps Assignment – Private EC2 behind ALB using Terraform

## Objective
Deploy a Python application running in private EC2 instances behind an Application Load Balancer (ALB) using Terraform.
The application listens on **port 8080** and provides:
- `/` → returns a greeting  
- `/health` → returns `ok`

---

## Project Structure

```
devops-assignment/
├── app/                 # Python application (main.py)
├── terraform/           # Terraform configuration files
├── scripts/             # deploy.sh, test.sh, destroy.sh (optional)
├── screenshots/         # AWS verification screenshots
└── README.md            # Project documentation
```

## How to Deploy the Infrastructure

### **1. Configure AWS CLI**
Run this and enter your Access Key, Secret Key, region (`us-east-1`), and output format (`json`):

```
aws configure
```

---

### **2. Deploy the Infrastructure**

```
cd terraform
terraform init
terraform plan -out plan.tfplan
terraform apply "plan.tfplan"
```

Terraform will create:

- VPC (public + private subnets)
- Internet Gateway
- NAT Gateway
- Route Tables
- ALB + Target Group + Listener (port 80 → port 8080)
- Security Groups
- Launch Template with user_data
- Auto Scaling Group
- Private EC2 instances (no public IP)
- IAM roles + SSM access

---

### **3. Test the Application**

Get the ALB DNS:

```
terraform output -raw alb_dns
```

Test:

```
curl http://<ALB_DNS>/
curl http://<ALB_DNS>/health
```

Expected output:

- `/` → `Hello from private EC2!`
- `/health` → `ok`

---

### **4. Teardown (Destroy Everything)**

```
terraform destroy -auto-approve
```

This deletes all created AWS resources.

---

## Required Screenshots

These should be placed inside the `screenshots/` folder.

1. **01_alb_details.png**  
   - EC2 Console → Load Balancers → `asg-alb`  
   - Capture ALB description: DNS, scheme, subnets.

2. **02_alb_listeners.png**  
   - ALB → Listeners tab  
   - Show port 80 listener forwarding to target group.

3. **03_target_group_health.png**  
   - EC2 → Target Groups → `asg-tg`  
   - Show instance health status.

4. **04_asg_details.png**  
   - EC2 → Auto Scaling Groups → `asg-private`  
   - Show desired instances and running instances.

5. **05_ec2_instance_details.png**  
   - EC2 → Instances  
   - Show instance info: private IP, no public IP.

6. **06_vpc_subnets.png**  
   - VPC Console → Subnets  
   - Filter by created VPC ID  
   - Show public + private subnets.

7. **07_ssm_managed_instances.png** (optional)  
   - Systems Manager → Managed Instances  
   - Show instance registered with SSM.

---

## Notes
- All infrastructure tested and destroyed to avoid AWS charges.  
- To redeploy, repeat steps under **"How to Deploy"**.
- This project demonstrates AWS networking, ALB, ASG, EC2, SSM, IAM, and Terraform IaC skills.

---
