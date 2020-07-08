
# Docker AMI

This repository automates the process of building a base Docker AMI on EC2. (Building on Ubuntu 18.4, `ami-0ac80df6eff0e70b5`.)

Terraform is used to create the sandbox instance on EC2; then Ansible is used to install Docker and create the AMI.

## Usage

1. On the host machine, install:

    - [Poetry](https://python-poetry.org/)
    - [Terraform](https://www.terraform.io/) (>= 0.12.28)

1. Run `./setup.sh`, which initializes the Terraform project and installs Python dependencies.

1. Create a `terraform.tfvars` file in the root directory, and provide values for the three required variables:

    ```hcl
    vpc_id          = "vpc-XXX"
    subnet_id       = "subnet-XXX"
    public_key_path = "/path/to/key.pub"
    ```

1. Run `./build.sh`. This will create the instance, install Docker, create the AMI, and log the AMI id to the terminal in the last Ansible step.

1. After the AMI has been created, `terraform destroy` is run to remove the EC2 resources - type `yes` to confirm.