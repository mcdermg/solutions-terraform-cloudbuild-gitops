#####################################
## TF & Provider
#####################################

terraform {
  required_version = "1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.10.0"
    }
  }
  backend "gcs" {
     bucket = "testing-gitops-tfstate"
     prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
