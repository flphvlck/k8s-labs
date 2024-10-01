variable "google_provider_project" {
  type        = string
  description = "Google Cloud Project"
  default     = "k8s-lab"
}

variable "google_provider_region" {
  type        = string
  description = "Google Cloud Region"
  default     = "europe-west3"
}

variable "google_provider_zone" {
  type        = string
  description = "Google Cloud Zone"
  default     = "europe-west3-a"
}
