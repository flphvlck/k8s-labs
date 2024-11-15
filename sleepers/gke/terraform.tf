terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.4.0"
    }
    random = {
      source  = "hashicorp/random" 
      version = ">= 3.6.3"
    }
  }
  required_version = ">= 1.9.6"
}
