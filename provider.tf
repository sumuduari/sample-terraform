
# provider.tf

# Specify the provider and access details
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = var.aws_region
}