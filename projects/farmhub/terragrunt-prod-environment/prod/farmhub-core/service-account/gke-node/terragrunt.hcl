terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-service-account.git//"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  service_account_id = "gke-node-container"
}
