# Configure AWS as a Provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.54.0"
    }
  }
}

provider "aws" {
    region = "us-west-1"
    shared_credentials_file = "C:/AWSpass/credentials.txt"
    profile = "default"
  # Configuration options
}

# Windows Server 2012 R2 Base
resource "aws_instance" "AD" {
  ami           = "ami-094f5969dd2e48f3c"
  instance_type = "t2.micro"
  key_name = "Password"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow ssh traffic"


  ingress {

    from_port   = 3389 #  By default, the windows server listens on TCP port 3389 for RDP
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}
# Run command "terraform init" in Terminal
# Run terraform plan - Sanity check, so you wont break anything
# Run terraform apply - This will create the VM instance in AWS