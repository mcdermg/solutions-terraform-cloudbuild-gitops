# Random name
resource "random_pet" "vpc_name" {
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${random_pet.vpc_name.id}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL" # "REGIONAL"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name                     = "${random_pet.vpc_name.id}-subnet"
  region                   = var.region
  network                  = google_compute_network.vpc.name
  ip_cidr_range            = "10.0.0.0/24"
  private_ip_google_access = true
}

resource "google_compute_router" "router" {
  name    = "${random_pet.vpc_name.id}-nat-router"
  region  = google_compute_subnetwork.subnet.region
  network = google_compute_network.vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                                = "${random_pet.vpc_name.id}-nat-config"
  router                              = google_compute_router.router.name
  region                              = google_compute_router.router.region
  nat_ip_allocate_option              = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  enable_endpoint_independent_mapping = "false"
}
