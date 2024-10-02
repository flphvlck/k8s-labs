resource "random_pet" "name" {
  length  = 2
  prefix = "lab"
}

resource "google_service_account" "gke_node" {
  account_id   = "gke-node-${random_pet.name.id}"
  display_name = "GKE Node Service Account"
}

resource "google_project_iam_member" "gke_node_role" {
  project = var.google_provider_project
  role    = "roles/container.defaultNodeServiceAccount"
  member  = "serviceAccount:${google_service_account.gke_node.email}"
}

resource "google_compute_network" "lab_network" {
  name                    = "${random_pet.name.id}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "lab_subnet" {
  name          = "${random_pet.name.id}"
  ip_cidr_range = "10.1.0.0/16"
  network       = google_compute_network.lab_network.id

  secondary_ip_range {
    range_name    = "${random_pet.name.id}-pods"
    ip_cidr_range = "10.255.0.0/16"
  }
}

resource "google_container_cluster" "lab_cluster" {
  name                     = "${random_pet.name.id}"
  deletion_protection      = false
  location                 = var.google_provider_zone
  remove_default_node_pool = true
  initial_node_count       = "1"
  datapath_provider        = "ADVANCED_DATAPATH"
  network                  = google_compute_network.lab_network.id
  subnetwork               = google_compute_subnetwork.lab_subnet.id

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "${random_pet.name.id}-pods"
  }

  workload_identity_config {
    workload_pool = "${var.google_provider_project}.svc.id.goog"
  }
}

resource "google_container_node_pool" "primary_spot" {
  name               = "primary-spot"
  cluster            = google_container_cluster.lab_cluster.name
  location           = var.google_provider_zone
  initial_node_count = 2

  node_config {
    spot            = true
    machine_type    = "e2-medium"
    service_account = google_service_account.gke_node.email
  }

  autoscaling {
    total_min_node_count = 2
    total_max_node_count = 4
  }
}
