# Terraform Deployment
>Note: This terraform code will create an infra in Azure for setting up a dev docker swarm cluster
## Terraform introduction
Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

## Steps to run the terraform script
### 1. Authentication
1. Ensure that new Service pricipal is added, refer the [(docs)](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)
2. Update **changeme** to the actual values in the `env_variables.tfvars` file, that can be obtained from the Azure Subscirption page.
3. Update the values if anything required specifically for the infra in `env_variables.tfvars.tf`

```terraform
client_secret           = changeme
client_id               = changeme
tenant_id               = changeme
subscription_id         = changeme
location                = changeme
resource_grp_name       = changeme
storage_acnt_name       = changeme
storage_container_name  = changeme
env                     = changeme
pg_server_name          = changeme
pg_database_name        = changeme
pg_username             = changeme
pg_password             = changeme
```

### To setup Blob to keep state file [(docs)](https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli)

First setup all the necessary resource group, storage account and blob to store the state file.
```shell
az login

RESOURCE_GROUP_NAME=terraform
STORAGE_ACCOUNT_NAME=terraform
CONTAINER_NAME=tfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location southeastasia

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
```

Then add the `backend` config in [`provider.tf`](provider.tf)
```terraform
  backend "azurerm" {
    resource_group_name  = "terraform-infra"
    storage_account_name = "terraforminfra"
    container_name       = "tfstate"
    use_oidc             = true
    client_id            = "changeme"
    subscription_id      = "changeme"
    tenant_id            = "changeme"
  }
  ```
### 2. Quick Start Setup
1. Install terraform [(docs)](https://learn.hashicorp.com/tutorials/terraform/install-cli).
2. Run `terraform init`.
3. Run `terraform plan -var-file="env_variables.tfvars"` to plan.
3. Run the `terraform apply -var-file="env_variables.tfvars"` to deploy.
4. If any changes in terraform script repeat from step 2.
5. To clean up and delete all resources after you're done, run `terraform destroy -var-file="env_variables.tfvars"`
