variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "my-custom-eks-cluster"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the existing VPC"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs (At least two in different Availability Zones)"
}
