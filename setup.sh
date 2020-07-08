#!/bin/sh

poetry install
poetry run ansible-galaxy install -r requirements.yml
terraform init
