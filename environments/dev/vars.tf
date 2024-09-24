variable "gcp" {
  type = object({
    project = string
    region  = string
  })

  default = {
    project = "kub-workshop-436511"
    region  = "europe-west1"
  }
}

variable "GCP_CREDENTIALS" {
  type      = string
  sensitive = true
}
