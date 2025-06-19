

output "website_url" {
  description = "The S3 static website endpoint"
  value       = "http://${aws_s3_bucket.website.bucket_regional_domain_name}"
}