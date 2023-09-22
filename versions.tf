terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.25.2"
    }
  }
}

provider "newrelic" {
    account_id = var.newrelic_account_id
}