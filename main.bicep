targetScope = 'subscription'

@description('Resource group name')
param rgName string

@description('Deployment location')
param location string = deployment().location

@description('Prefix for the storage account')
param storagePrefix string

@description('Admin username for VM')
param adminUsername string

@description('Admin password for VM')
@secure()
param adminPassword string

// Create the Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

// Import shared variables
module vars './vars.bicep' = {
  name: 'varsDeployment'
  scope: rg
  params: {
    location: location
    rgName: rgName
    storagePrefix: storagePrefix
    adminUsername: adminUsername
  }
}

// Deploy the VM module inside the Resource Group
module vm './vm.bicep' = {
  name: 'vmDeployment'
  scope: rg
  dependsOn: [vars]
  params: {
    location: vars.outputs.location
    storagePrefix: vars.outputs.storagePrefix
    adminUsername: vars.outputs.adminUsername
    adminPassword: adminPassword
  }
}

output resourceGroupName string = rg.name
output storagePrefix string = vars.outputs.storagePrefix
