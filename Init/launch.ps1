<#
.SYNOPSIS
    Create initial resource for Terraform deployment.
.DESCRIPTION
    This script set initial resources (user assigned identity, storage account) for terraform deployment.
    The managed identity is assigned a contributor role on the subscription level. 
.NOTES
    The script uses az commands, extension is not required.
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [String]$subscriptionName = "Visual Studio Enterprise Subscription – MPN",

    [Parameter(Mandatory)]
    [String]$rgName,

    [Parameter()]
    [String]$location = "northeurope",

    [Parameter()]
    [String]$tags = "Projet=k8s",

    [Parameter()]
    [String]$userIdentity,

    [Parameter()]
    [string]$storageAccountName,

    [Parameter()]
    [string]$containerName
)

# Connect to Azure
#az login
az account set -n $subscriptionName

# Get current subscription info
$subscriptionId = az account show -n $subscriptionName --query id --output tsv
Write-Host "Subscription Id : $subscriptionId"

# Create Resource group
write-host "Creating Resource group $rgName ..." 
az group create -n $rgName -l $location --tags $tags

# Create user-assigned managed identity
write-host "Creating User Identity $userIdentity ..." 
az identity create -g $rgName -n $userIdentity
Start-Sleep -Seconds 10
$UserID = az identity list --query [*].principalId --out tsv
Write-Host "Here is the UserID : $userID"

write-host "Adding role to the identity..."
az role assignment create --assignee $UserID --role Contributor --scope /subscriptions/$subscriptionId

# Create Storage account and container for Terraform
write-host "Creating Storage Account (Standard LRS, StorageV2 kind)  ..." 
az storage account create -n $storageAccountName -g $rgName -l $location --sku Standard_LRS --min-tls-version TLS1_2 --allow-shared-key-access false

write-host "Creating Container ..."
az storage container create -n $containerName --account-name $storageAccountName --public-access off

write-host "End of script..."
