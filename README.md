# Integrate Terraform Cloud with GitHub Actions to automate the infrastructure provisioning of AWS EC2.

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

provisioned three ec2 by existed modules using terraform cloud as remote backend. and automated Terraform with CI/CD pipeline in Git Action.
## Infrastructure


## Summary

- This repo will create resources in AWS according to REQUIREMENT.md using Terraform.
- create an organization and workspace in terraform cloud to manage status file and perform team-oriented remote Terraform workflow.
- github action act as CI/CD tool to automate the infrastructure by two pipelines(terraform_plan_apply(auto trigger),and terraform_destroy(manually trigger))

## Remote backend configuration
| name | object |description|
| ------ | ------ |------ |
| code_test | organization|a shared space for teams to collaborate on workspaces on terraform cloud |
|code_test_workspace  | workspace | Working with Terraform involves managing collections of infrastructure resources|
|owners| team | group of Terraform Cloud users within an organization |
|anonymous_public | user | belong to team, which are granted permissions on an organization’s workspaces|
| AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY  | Workspace variables| terraform use these variables for all plans and applies in this workspace|
| TF_API_TOKEN | API TOKEN| allow github actions workflow can authenticate to Terraform Cloud. |
| Team API Token | Team API Token| Team API tokens are used by services, for example a CI/CD pipeline, to perform plans and applies on a workspace.Treat this token like a password, as it can be used to access into organization without a username, password, or two-factor authentication. |

## Usage

please make sure you have terraform installed. To run this repo please execute:
```sh
git clone https://github.com/abbyli-88/AWS-Terraform-Technical-Test.git
```
```sh
cd AWS-Terraform-Technical-Test
terraform login
```
Enter "yes " and input this token for the prompt, this is API token for the organization in terraform cloud
```sh
AYT4KObjew9mwA.atlasv1.VkoDu6zCvqBJIGemRaNaMvaGfTWCxuExekb3l0aOdv6BrfxysHly9kb1cZQICPSS9TA
```
Execute following terraform CMD
```sh
terraform init
terraform plan
terraform apply
terraform output instance_id && terraform output key_pairs_map
```
you can also [login terraform cloud](https://app.terraform.io/session) through this public user account to view workflow or execute terraform cmd by user interface
```sh
username: anonymous_public
password: Qwer_1234_!
```
In the end,cleanup all the resources by
```sh
terraform destroy
```
## Pipeline Flow

| pipeline name | description |
| ------ | ------|
| terraform_plan_apply | 1. generate format test, a plan and status test report(success or failure of the steps in pipeline) for every pull request automatically.2.generate all the steps mentioned above and if there is no error in terraform plan, create all the resources in the terraform workspace for meger and push in main branch automatically. |
| terraform_destroy | delete all the resources in the work space by manually trigger terraform-destroy pipeline. |







