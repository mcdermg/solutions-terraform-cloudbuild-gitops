variable "project_id" {
  description = "GCP project name"
  # TODO hardcoding this for testing but use secrets maanager and syntax in cloudbuild yaml to ref it.
  default     = "testing-gitops"
}

variable "region" {
  description = "Region to use in the GCP provider"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone to use in the GCP provider"
  default     = "us-central1-c"
}

variable "zones" {
  description = "Zones to use for the infrastructure in GCP"
  type        = list(string)
  default     = ["us-central1-c", "us-central1-f"]
}
