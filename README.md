
# Project Title

1. Terraform templates to deploy an in-memory web app

### Prerequisites

1. Terraform v 0.11.3 (Other versions might support, not tested) 
```
https://www.terraform.io/downloads.html
```
2. AWS access key and secret key. Set them up
```
https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html
```

### How to run

1. Go inside terraform directory
```
cd terraform
```

2. Edit the variables.tf file, the pupose of each variable mentioned in line.
```
vi variables.tf 
```

3. Run terraform commands
```
terraform init
terraform plan  (optional)
terraform apply 
```
Once the command promots for input, type 'yes'

4. At the end of execution, it will print a DNS (eg bg-load-balancer-1064785588.us-west-2.elb.amazonaws.com) name. Hit it in the broswer. It takes a few mins for the nodes to fully initialize, so don't be disappointed if it does not work immediately.
```
http://bg-load-balancer-1064785588.us-west-2.elb.amazonaws.com
https://bg-load-balancer-1064785588.us-west-2.elb.amazonaws.com
```
### Verify
If everything works you'll see a page with the message
```
Hello EdgeMaster! :-)
```

## Versioning

Version 1.0

## Authors

* **Soumitra Kar**

