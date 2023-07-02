terraform {
  cloud {
    organization = "yuri-og-1"

    workspaces {
      name = "yuri-ws-1"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "vpc_1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.prefix}-vpc-1"
  }
}

resource "aws_subnet" "sub_1" {
  vpc_id = aws_vpc.vpc_1.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.prefix}-sub-1"
  }
}