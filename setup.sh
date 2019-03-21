#!/bin/sh

pipenv install
terraform init
pipenv run ansible-galaxy install -r roles.yml
