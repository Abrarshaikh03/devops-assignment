#!/bin/bash
cd terraform
ALB_DNS=$(terraform output -raw alb_dns)
echo "Testing ALB at: $ALB_DNS"
echo "Root:"
curl -sS "http://${ALB_DNS}/"
echo -e "\nHealth:"
curl -sS "http://${ALB_DNS}/health"
