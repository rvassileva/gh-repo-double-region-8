terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  alias  = "ireland"
  region = "eu-west-1"
}

provider "aws" {
  alias  = "frankfurt"
  region = "eu-central-1"
}

resource "aws_instance" "test_server_1" {
  provider      = aws.ireland
  ami           = "ami-04149c54d7c56180d"
  instance_type = "t2.micro"

  tags = {
    Name = "My Test Instance in Ireland"
  }
}

resource "aws_instance" "test_server_2" {
  provider      = aws.frankfurt
  ami           = "ami-098efcc0d4f80810e"
  instance_type = "t2.micro"

  tags = {
    Name = "My Instance in Frankfurt"
  }
}
