output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.compute.alb_dns_name
}

output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = module.storage.cloudfront_domain_name
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket hosting the frontend"
  value       = module.storage.s3_bucket_name
}

output "redis_endpoint" {
  description = "The endpoint of the ElastiCache Redis cluster"
  value       = module.storage.redis_endpoint
}
