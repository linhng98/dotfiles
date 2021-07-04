terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-virtual-private-cloud.git//"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name_prefix = "farmhub-vpc"
  region      = "asia-southeast2"

  private_service_connection = {
    address       = "10.255.16.0"
    prefix_length = 20
  }
}
