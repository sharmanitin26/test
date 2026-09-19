targetScope = 'resourceGroup'

@description('Azure region supported by Static Web Apps')
param location string = 'centralus'

@description('Globally unique Static Web App name')
param staticWebAppName string = 'trip-centric-${uniqueString(resourceGroup().id)}'

resource staticWebApp 'Microsoft.Web/staticSites@2023-12-01' = {
  name: staticWebAppName
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {}
}

output staticWebAppName string = staticWebApp.name
output websiteUrl string = 'https://${staticWebApp.properties.defaultHostname}'
