provider "google" {
  project = "gcp-cloud-native-project" 
  region  = "europe-west9"
  zone    = "europe-west9-a"
}

# Création du registre Docker
resource "google_artifact_registry_repository" "mon_repo_docker" {
  location      = "europe-west9"
  repository_id = "mon-repo-devops"
  description   = "Dépôt Docker géré par Terraform"
  format        = "DOCKER"
}

# Création du cluster Kubernetes (GKE)
resource "google_container_cluster" "mon_cluster_gke" {
  name     = "cluster-devops-production"
  location = "europe-west9-a"

  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = false 
}

# Création des serveurs pour le cluster
resource "google_container_node_pool" "noeuds_primaires" {
  name       = "pool-de-noeuds-1"
  location   = "europe-west9-a"
  cluster    = google_container_cluster.mon_cluster_gke.name
  node_count = 1 

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
  }
}
