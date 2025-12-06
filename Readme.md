Terraform project which deploys app service in azure with 2 deployment slots[testing, staging].

Pre-requisite
0. Create App registration + Federated Credentials for OIDC connection[passwordless authentication] && assign Contributor/(least privileage) role to this identity at Subscription Layer.
1. Bootstraping of Terraform: Create 1 Azure storage account and a container in it and pass this information in backend.tf [for terraform init]
2. AzureMYSQL database flexible servers.
   

Security:
1. uses OIDC to authenticate with azure.
2. uses Github Action secret variable feature to store DB creds and authenticate the application with database server.
3. Stores tfstate file remotely in Azure Blob Containers with lease locks.

Features:
0. One click provisioning and destroy feature. 
1. Modular terraform structure to facilitate easy and quick provisioning of azure app service resources.
2. Github action workflow with workflow_dispatch.input feature to ease init, plan, apply and destroy terraform.
3. tfvars file to control all variables from one place.
