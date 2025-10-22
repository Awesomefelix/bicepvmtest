@description('Deployment location')
param location string = 'eastus'

@description('Base name for resource group')
param rgName string = 'my-rg'

@description('Base prefix for storage accounts')
param storagePrefix string = 'mystorageaccount'

@description('VM admin username')
param adminUsername string = 'azureuser'

// Computed names
var vnetName = 'my-vnet'
var subnetName = 'my-vm-subnet'
var subnetPrefix = '10.10.1.0/24'
var publicIpName = 'my-vm-public-ip'
var nicName = 'my-vm-nic'
var privateEndpointName = 'my-storage-private-endpoint'
var vmName = 'vmName'
var vmSize = 'Standard_B2s'

// Outputs to share with parent
output location string = location
output rgName string = rgName
output storagePrefix string = storagePrefix
output adminUsername string = adminUsername

output vnetName string = vnetName
output subnetName string = subnetName
output subnetPrefix string = subnetPrefix
output publicIpName string = publicIpName
output nicName string = nicName
output privateEndpointName string = privateEndpointName
output vmName string = vmName
output vmSize string = vmSize
// adminPassword is a secret and must not be exported as an output; do not expose secrets here
