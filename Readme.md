Terraform project which deploys app service in azure with 2 deployment slots[testing, staging].

Pre-requisite
1. Create App registration + Federated Credentials for OIDC connection[passwordless authentication] && assign Contributor/(least privileage) role to this identity at Subscription Layer.
2. Bootstraping of Terraform: Create 1 Azure storage account and a container in it and pass this information in backend.tf [for terraform init]
3. AzureMYSQL database flexible servers.
4. Store AZURE_CLIENT_ID, AZURE_TENANT_ID, AZURE_SUBSCRIPTION_ID, DB_HOST, DB_NAME, DB_USER, DB_PASSWORD as Github Actions secrets.
   

Security:
1. uses OIDC to authenticate with azure.
2. uses Github Actions Environment variables to inject DB credentials into the application through terraform.
3. Stores tfstate file remotely in Azure Blob Containers with lease locks.

Features:
1. One click provisioning and destroy feature. 
2. Modular terraform structure to facilitate easy and quick provisioning of azure app service resources.
3. Github action workflow with workflow_dispatch.input feature to ease init, plan, apply and destroy terraform.
4. tfvars file to control all variables from one place.
