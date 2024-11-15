provider "google" {
  project = var.google_provider_project
  region = var.google_provider_region
  zone = var.google_provider_zone
}

provider "random" {}
