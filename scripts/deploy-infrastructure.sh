#!/bin/bash
# A helper script to manually deploy infrastructure
set -e

cd ../terraform
echo "Initializing Terraform..."
terraform init

echo "Validating Terraform code..."
terraform validate

echo "Planning Terraform deployment..."
terraform plan -out=tfplan

echo "Do you want to apply this plan? (y/n)"
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
    echo "Applying Terraform plan..."
    terraform apply tfplan
else
    echo "Deployment cancelled."
fi
