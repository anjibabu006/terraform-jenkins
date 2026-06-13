terraform {
  backend "s3" {
    bucket  = "terraform-backend-created-demo"
    key     = "terraform/production_cluster/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true

    # Highly Recommended: Enable Native S3 State Locking (Terraform 1.10+)
    use_lockfile = true
  }
}
