output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.compute.alb_dns_name
}

output "s3_website_endpoint" {
  description = "The endpoint of the S3 static website hosting the frontend"
  value       = module.storage.s3_website_endpoint
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket hosting the frontend"
  value       = module.storage.s3_bucket_name
}

output "redis_endpoint" {
  description = "The endpoint of the ElastiCache Redis cluster"
  value       = module.storage.redis_endpoint
}
