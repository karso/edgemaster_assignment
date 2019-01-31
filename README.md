
# Project Title

1. Terraform templates to deploy an in-memory web app

### Prerequisites and Justification

1. Terraform v 0.11.3 (Other versions might support, not tested) 
```
https://www.terraform.io/downloads.html
```
It is an open source tool by HashiCorp to implement infrastructure as Code. It supoorts almost all major cloud platforms. Terraform has a very strong community support too.

2. AWS

First set up access key and secret key.
```
https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-credentials.html
```
Also, create a couple of roles. These are required for ECS service to access other services. 
```
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_execution_IAM_role.html
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/autoscale_IAM_role.html
https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-service.html
```
AWS provides a lot of advanced cloud services. One of them is Elastic Container Service. It is a highly scalable container management service for managing Docker containers in a cluster. I used a technology called 'FARGATE' along with it. It is a compute engine that reduces the overhead of managing host instances.  

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
terraform apply -var display_string='YOUR SPECIAL STRING'
```
Once the command promots for input, type 'yes'

4. At the end of execution, it will print a DNS (eg bg-load-balancer-{somerandomnumber}.us-west-2.elb.amazonaws.com) name. Hit it in the broswer. 
```
http://bg-load-balancer-{somerandomnumber}.us-west-2.elb.amazonaws.com
https://bg-load-balancer-{somerandomnumber}.us-west-2.elb.amazonaws.com
```
### Verify
If everything works you'll see a page with the message
```
YOUR SPECIAL STRING
```

## Versioning

Version 1.1

## ToDo
1. Add logs. CloudWatch - [DONE]
2. Pass the text from command line rather than hard coding. [DONE]
3. Test other versions of terraform

## Authors

* **Soumitra Kar**

