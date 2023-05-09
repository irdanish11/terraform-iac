
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "profile" {
  type = string
}


## VPC variables
variable "vpc-cidr-block" {
  type = string
}

variable "public-subnets-cidr-blocks" {
  type = list(string)
}

variable "private-subnets-cidr-blocks" {
  type = list(string)
}

variable "public-subnet-1-cidr-block" {
  type = string
}

variable "public-subnet-2-cidr-block" {
  type = string
}

variable "public-subnet-3-cidr-block" {
  type = string
}

variable "private-subnet-1-cidr-block" {
  type = string
}

variable "private-subnet-2-cidr-block" {
  type = string
}

variable "private-subnet-3-cidr-block" {
  type = string
}

variable "ec2-bastion-public-key-path" {
  type = string
}

variable "ec2-bastion-private-key-path" {
  type = string
}

variable "ec2-bastion-ingress-ip-1" {
  type = string
}

variable "bastion-bootstrap-script-path" {
  type = string
}

## RDS variables
variable "rds-postgres-db-username" {
  type = string
}

variable "rds-postgres-db-password" {
  type = string
}

variable "rds-postgres-db-name" {
  type = string
}

variable "rds-postgres-db-port" {
  type = number
}

variable "rds-postgres-db-maintenance-window" {
  type = string
}