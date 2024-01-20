Wordpress_Iac
=========

This project was intended to be an ansible playbook to deploy a secure wordpress using Github Action CI and best practices around ansible testing.
But it evolved to a complete project with Terraform to host our wordpress in a public cloud.

# Prerequisite

You need to have setup in your AWS an S3 and a DynamoDB table for your terraform.tfstate file management.
You need also to install Terraform, Ansible and aws-cli.

# How to setup the project ?

Copy the file `.env.example` and setup your aws credentials, S3 and Dynamodb lock file.

# Notice

If you don't know what you are doing at this stage than maybe this project is not for you.
You can comeback later when this project will be flagged production ready.
