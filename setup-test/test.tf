terraform {
  backend "azurerm" {
    resource_group_name  = "codespaces-demo-resources"
    storage_account_name = "codespacesstate1"
    container_name       = "codespacesstate"
    key                  = "setuptest.state"
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.2"
    }
    azapi = {
      source  = "Azure/azapi"
    }
  }
}

provider "azapi" {
}

provider "azurerm" {
  features {}
}

locals {
  location = "eastus"
}

resource "azurerm_resource_group" "rg" {
  name = "testresources"
  location = local.location
}

resource "azurerm_log_analytics_workspace" "laws" {
  name                = "testlaw"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azapi_resource" "container_app_environment" {
  name = "testenvironment"  
  location = local.location
  parent_id = azurerm_resource_group.rg.id
  type = "Microsoft.App/managedEnvironments@2022-01-01-preview"
  body = jsonencode({
    properties = {
        appLogsConfiguration = {
            destination = "log-analytics"
            logAnalyticsConfiguration = {
                customerId = azurerm_log_analytics_workspace.laws.workspace_id
                sharedKey = azurerm_log_analytics_workspace.laws.primary_shared_key
            }
        }
    }
  })
}

resource "azapi_resource" "container_app" {
  name = "testapp"  
  location = local.location
  parent_id = azurerm_resource_group.rg.id
  type = "Microsoft.App/containerApps@2022-01-01-preview"
  body = jsonencode({
    properties = {
      managedEnvironmentId = azapi_resource.container_app_environment.id
      configuration = {
        ingress = {
          targetPort = 80
          external = true
        }
      }
      template = {
        containers = [
          {
            image = "docker.io/nginxdemos/hello:latest"
            name = "testcontainer"
          }
        ]
      }
    }
  })
}