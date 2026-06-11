terraform {
  backend "s3" {
    bucket         = "terraform-backend-created-janga"
    key            = "terraform/${var.workflow_name}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true

    # Highly Recommended: Enable Native S3 State Locking (Terraform 1.10+)
    use_lockfile   = true 
  }
}
