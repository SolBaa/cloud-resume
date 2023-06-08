terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_s3_bucket" "resume" {
  bucket = "sol-test-152"
}

# Upload an object
resource "aws_s3_bucket_object" "object1" {
  for_each     = fileset("./resume/", "**")
  bucket       = data.aws_s3_bucket.resume.id
  key          = each.value
  source       = "./resume/${each.value}"
  etag         = filemd5("./resume/${each.value}")
  content_type = "text/html"
}
