#!/bin/sh

terraform apply -auto-approve
poetry run ansible-playbook deploy.yml
terraform destroy
