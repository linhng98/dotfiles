terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-cloud-network-peering.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "farmhub_southeast1_vpc" {
  config_path = "../vpc/farmhub-southeast1"
}

dependency "farmhub_vpc" {
  config_path = "../vpc/farmhub"
}

inputs = {
  network_peerings = [
    {
      network      = dependency.farmhub_vpc.outputs.network_id
      peer_network = dependency.farmhub_southeast1_vpc.outputs.network_id
    },
    {
      network      = dependency.farmhub_southeast1_vpc.outputs.network_id
      peer_network = dependency.farmhub_vpc.outputs.network_id
    },
  ]
}
