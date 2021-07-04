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
  bucket   = "farmhub-core-helmcharts"
  location = "asia-southeast2"
}

inputs = {
  bucket        = local.bucket
  storage_class = "STANDARD"
  location      = local.location

  service_accounts_permissions = [
    {
      service_account = dependency.runner.outputs.service_account_email,
      roles           = ["roles/storage.objectViewer"]
    },
  ]

  cors = {
    origin          = ["*"]
    method          = ["*"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}