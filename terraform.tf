terraform {
  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = "1.3.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.2"
    }
  }
}
