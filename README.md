# terraform-aws-ec2-ssh
Terraform & AWS: How to provisioning and connect into the EC2 machine with SSH

## Table of Contents
- [terraform-aws-ec2-ssh](#terraform-aws-ec2-ssh)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [How does it work?](#how-does-it-work)
  - [Setup AWS credentials](#setup-aws-credentials)
  - [Create a AWS Key pairs](#create-a-aws-key-pairs)
  - [Create the Terraform files](#create-the-terraform-files)
  - [Terraform CLI Usage](#terraform-cli-usage)
  - [Contributing](#contributing)
  - [License](#license)

## Requirements
- AWS Account 
- Terraform
- AWS CLI
- Linux CLI 

## How does it work?
Basically, the Terraform will create some resources on AWS, such as, EC2, SG and the Ansible will be invoked via Terraform resources (local-exec) to call Ansible Roles for then to install the Docker app on EC2 instance.

## Setup AWS credentials
Use the AWS Documentation to setup your AWS Credentials, basically you have some ways to do this, for example via credentials file or environment variables:

- In my case I used the ```~/.aws/credentials``` file to create my credentials:

```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

## Create a AWS Key pairs
Now you can create your Key pairs on AWS following the AWS Documentation below:

- [Create AWS Key pairs](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

Remember you can create a Terraform resource to provision automatically:

```hcl
resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")

  tags = {
    Name       = "my-key-aws"
    managed_by = "terraform"
  }
}
```

## Create the Terraform files
According to the best practices from the Terraform documentation, is necessary create several files ".tf" to keep the environment working fine, the Terraform will read all files ".tf" and will provision on the AWS Cloud.

- provider.tf
- securityGroups.tf
- ec2Intance.tf

## Terraform CLI Usage
Main commands:

```
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
```

Execute these commands after get completed before steps:

```
$ terraform init
$ terraform plan
$ terraform apply
$ terraform destroy
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
