terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-cloud-subnetwork.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "farmhub_vpc" {
  config_path = "../../../vpc/farmhub"
}

inputs = {
  network                  = dependency.farmhub_vpc.outputs.network
  name                     = "public-subnetwork-asia-southeast2"
  region                   = "asia-southeast2"
  private_ip_google_access = true
  primary_ip_cidr_range    = "10.0.0.0/20"
  secondary_ip_cidr_range  = "10.1.0.0/20"
  log_config               = null
}
