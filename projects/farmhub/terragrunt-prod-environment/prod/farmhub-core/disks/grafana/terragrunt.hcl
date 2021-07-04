terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-cloud-disk.git//"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  zone = "asia-southeast2-a"
  name = "grafana-persistent-disk"
  type = "pd-balanced"
  size = 20
  labels = {
    terraform   = "true"
    environment = "prod"
  }
}