
# Docker AMI

Build a base Docker AMI.

1. `./setup.sh`
1. Copy / link a public key to `./key.pub`.
1. `./build.sh`. The new AMI id will get logged to the terminal and written into a `docker-ami.auto.tfvars` file, which can be copied into other Terraform configs.

To override Terraform variables, take `changeme` off `local.auto.tfvars.changeme`.
