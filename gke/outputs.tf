output "cluster_get_credentials" {
  description = "Fetch credentials for a running cluster."
  value       = "gcloud container clusters get-credentials ${random_pet.name.id} --location=${var.google_provider_zone}"
}
