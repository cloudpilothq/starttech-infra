output "s3_bucket_name" {
  value = aws_s3_bucket.frontend.bucket
}

output "s3_website_endpoint" {
  value = aws_s3_bucket_website_configuration.frontend.website_endpoint
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.redis.cache_nodes[0].address
}
