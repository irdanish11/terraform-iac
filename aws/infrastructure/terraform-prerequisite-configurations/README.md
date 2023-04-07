## Preparing the Terraform environment for AWS

Terraform prerequisites contains the `terraform` manifests to prepare and setup the environment for the AWS infrastructure development using Terraform. We create following resources in this module:

- S3 bucket to store the terraform state.
- DynamoDB table to store the terraform state lock.
- A `hello-world` ECR repository to use it as a first image whenever we provision a new Lambda function.
- A Rout53 hosted zone to use it as a first DNS zone whenever we provision a new Route53 record.