# StartTech Infrastructure

This repository contains the Terraform configuration for the StartTech application infrastructure.

## Architecture

The infrastructure consists of:
- **Networking**: VPC with public and private subnets across two availability zones, Internet Gateway, and NAT Gateway.
- **Compute**: Application Load Balancer (ALB) and Auto Scaling Group (ASG) for the backend application, running on EC2 instances provisioned via Launch Templates.
- **Storage**: S3 Bucket and CloudFront distribution for frontend hosting. ElastiCache Redis cluster for caching.
- **Monitoring**: CloudWatch Log Groups, custom Dashboards, and Alarms for ALB 5xx errors and unhealthy hosts.

## Prerequisites

- Terraform ~> 1.5.0
- AWS CLI configured with credentials

## Deployment

To deploy the infrastructure manually:

1. Clone the repository.
2. Navigate to the `terraform/` directory.
3. Run `terraform init`.
4. Run `terraform plan` to see the proposed changes.
5. Run `terraform apply` to provision the resources.

Alternatively, you can use the helper script:
```bash
./scripts/deploy-infrastructure.sh
```

## CI/CD

This repository uses GitHub Actions for CI/CD. The workflow in `.github/workflows/infrastructure-deploy.yml` will automatically run `terraform plan` on pull requests and `terraform apply` when changes are merged into the `main` branch.

Ensure the following GitHub Secrets are set:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
