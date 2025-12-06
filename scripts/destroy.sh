#!/bin/bash
#!/bin/bash
set -e
cd terraform
terraform destroy -auto-approve
echo "Destroyed resources."
