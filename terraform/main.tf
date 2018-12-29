## --------------------------------
## Provider
## --------------------------------


provider "aws" {
  shared_credentials_file = "$HOME/.aws/credentials"
  version 		  		 = "1.33.0"
  profile                 = "${var.aws_profile}"
  region                  = "${var.aws_region}"
}
