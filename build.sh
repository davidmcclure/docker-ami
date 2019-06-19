#!/bin/sh

terraform apply -auto-approve
pipenv run ansible-playbook deploy.yml -vvv
terraform destroy
