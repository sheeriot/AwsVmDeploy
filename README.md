# Terraform: Azure VM Deploy

This project (AzureVmDeploy) uses Terraform to plan, deploy, and destory a Linux VM. This is setup to be run as a manual GitHub Actions Workflow.

This repository uses GitHub environment variables and secrets to deploy Virtual Machines (VMs) to Azure using GitHub Actions for Terraform automation.

Note this README is expanded in the README folder:

- [README/docs/01_overview.md](README/docs/01_overview.md)

## How To

1. First run the TFState Apply component. You can test with Plan. After TF State is deployed, validate it in the Azure portal. Go to the new Azure Storage Account and get an Access Key to provide as secret ARM_ACCESS_KEY in GitHub.

1. Next deploy the Network component. The terraform state for the Network component will be saved in the Terraform State account. Go look at it. Validate.

1. Setup the Terraform for the new Virtual Machine (VM).

   - add your own source IP address (for SSH access) and SSH Public Key
     - edit the `azure/devhost/terraform.vars` as needed
     - an SSH (TLS) Key-Pair is also created as a terraform resource and stored with terraform state
         - the public key has been provided to the new linux host as an `authorized_key`
         - the private key can be used as an `IdentityFile`
   - modify the terraform as you see fit including the file `scripts/cloud-init.tfpl` to customize your linux host on first boot

1. Update the env.sh file header variables to name your Network and Compute.

- `INFRA_NAME`
- `COMPUTE_NAME`

1. Deploy your VM

1. SSH to your VM using your defined IP address (source) and Public Key (added).
