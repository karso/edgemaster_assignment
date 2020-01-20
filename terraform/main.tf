## --------------------------------
## Provider
## --------------------------------


provider "aws" {
  shared_credentials_file = "$HOME/.aws/credentials"
  version 		            = "2.7"
  profile                 = var.aws_profile
  region                  = var.aws_region
}
