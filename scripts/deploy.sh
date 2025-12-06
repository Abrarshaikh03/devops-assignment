#!/bin/bash
set -e
cd terraform
terraform init
terraform apply -auto-approve
echo "ALB DNS:"
terraform output -raw alb_dns
