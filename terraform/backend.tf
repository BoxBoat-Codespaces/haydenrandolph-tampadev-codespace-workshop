terraform {
  backend "azurerm" {
    resource_group_name  = "codespaces-workshop-state"
    storage_account_name = "codespacesstate9"
    container_name       = "codespacesstate"
    key                  = "haydenrandolph.state"
  }
}