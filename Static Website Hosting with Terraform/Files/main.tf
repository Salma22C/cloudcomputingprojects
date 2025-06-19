provider "aws" {
  region  = var.aws_region
  version = "~> 4.0"
}

resource "aws_s3_bucket" "website" {
  bucket      = var.bucket_name
  force_destroy = true
}

# Allow public read access to the bucket
resource "aws_s3_bucket_public_access_block" "website_access_block" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Configure website hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Allow public read access via bucket policy
resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowPublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = ["${aws_s3_bucket.website.arn}/*"]
      }
    ]
  })
}

# Upload index.html
resource "aws_s3_object" "index_html" {
  bucket                 = aws_s3_bucket.website.id
  key                    = "index.html"
  source                 = "index.html"
  content_type           = "text/html"
  server_side_encryption = "AES256"
  acl                    = null
  etag                   = filemd5("index.html")
}

# Upload error.html
resource "aws_s3_object" "error_html" {
  bucket                 = aws_s3_bucket.website.id
  key                    = "error.html"
  source                 = "error.html"
  content_type           = "text/html"
  server_side_encryption = "AES256"
  acl                    = null
  etag                   = filemd5("error.html")
}

