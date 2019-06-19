
# Docker AMI

Build a base Docker AMI.

1. `./setup.sh`
1. Copy a public key to `./key.pub`.
1. `./build.sh`. The new AMI id will get logged to the terminal.

To override Terraform variables, take `changeme` off `local.auto.tfvars.changeme`.
