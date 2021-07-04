terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-enable-apis.git//"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  services = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "servicenetworking.googleapis.com",
    "redis.googleapis.com",
  ]
}
