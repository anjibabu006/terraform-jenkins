variable "ec2_name" {
  type = string
  default = "terraform-created"
}

variable "workflow_name" {
  type = string
}
variable "instance_count" {
  type = number
  default = 1
}
