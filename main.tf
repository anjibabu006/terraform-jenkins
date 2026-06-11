provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0152204c1a187337c"
  instance_type = "t3.micro"
  key_name      = "terraform"
  count         = 4
  tags = {
    Name = var.ec2_name"-${count.index}"
  }
}
