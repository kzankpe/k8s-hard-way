.<#
.SYNOPSIS
    A short one-line action-based description, e.g. 'Tests if a function is valid'
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Test-MyTestFunction -Verbose
    Explanation of the function or its result. You can include multiple examples with additional .EXAMPLE lines
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [String]$rgName,

    [Parameter()]
    [String]$location = "northeurope",

    [Parameter()]
    [String]$tags = "",

    [Parameter()]
    [String]$userIdentity,

    [Parameter()]
    [string]$storageAccountName,

    [Parameter()]
    [string]$containerName
)

# Connect to Azure
az login

# Create Resource group
write-host "Creating Resource group $rgName ..." 
az group create -n $rgName -l $location --tags $tags

# Create user-assigned managed identity
write-host "Creating User Identity $userIdentity ..." 
az identity create -g $rgName -n $userIdentity

# Create Storage account and container for Terraform
write-host "Creating Storage Account (Standard LRS, StorageV2 kind)  ..." 
az storage account create -n $storageAccountName - g $rgName -l $location --sku Standard_LRS --min-tls-version TLS1_2 --allow-shared-key-access false

write-host "Creating Container ..."
az storage container create -n $containerName --account-name $storageAccountName --public-access off