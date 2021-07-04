terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-storage-bucket.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "runner" {
  config_path = "../../service-account/gitlab-runner-helmcharts"
}

locals {
  bucket   = "farmhub-core-public-asset"
  location = "asia-southeast2"
}

inputs = {
  bucket          = local.bucket
  storage_class   = "STANDARD"
  location        = local.location
  allow_all_users = true

  cors = {
    origin          = ["*"]
    method          = ["*"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}