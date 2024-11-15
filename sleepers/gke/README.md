# GKE
Create zonal K8s cluster in Google Cloud with Terraform.

Define variables (if others than default in `variables.tf`):
```
cat <<EOF> terraform.tfvars
google_provider_project = "project_id"
google_provider_region  = "your-region1"
google_provider_zone    = "your-region1-a"
EOF
```
