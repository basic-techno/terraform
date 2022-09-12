variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-09e67e426f25ce0d7"
  }
}

variable "web_server_port" {
  default = 8080  
}

variable "ECS_INSTANCE_TYPE" {
  default = "t3.micro"
}

variable "KEY_NAME" {
  default = "basictechno"
}

variable "allowed_cidr_blocks" {
  default = "0.0.0.0/0"
}