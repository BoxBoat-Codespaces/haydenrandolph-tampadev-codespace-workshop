terraform {
  backend "azurerm" {
    resource_group_name  = "codespaces-demo-resources"
    storage_account_name = "codespacesstate1"
    container_name       = "codespacesstate"
    key                  = "<USERNAME>.state"
  }
}