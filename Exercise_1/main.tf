provider "aws" {
  region = "ap-southeast-1"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = "vpc-0d8f61d0d7a35709c"
}

variable "public_subnet_id" {
  description = "The ID of the public subnet"
  type        = string
  default     = "subnet-03df41695ac10ee8c"
}

resource "aws_instance" "udacity_t2" {
  count         = 4
  ami           = "ami-0ac9397cab55f5044"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-03012cca4321f7fc0"]
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "Udacity T2"
  }
}
