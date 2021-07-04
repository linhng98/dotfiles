terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-compute-instance.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../vpc/farmhub"
}

dependency "subnet" {
  config_path = "../../subnet/farmhub/public-subnetwork-asia-southeast2"
}

inputs = {
  name         = "vpn-gateway"
  zone         = "asia-southeast2-b"
  machine_type = "g1-small"

  scheduling = {
    preemptible       = false
    automatic_restart = true
  }
  tags = [
    "vpn-gateway",
    "${dependency.vpc.outputs.network_name}-allow-all",
    "${dependency.vpc.outputs.network_name}-allow-ping",
    "${dependency.vpc.outputs.network_name}-allow-ssh",
    "${dependency.vpc.outputs.network_name}-allow-wireguard",
  ]
  image_type = "ubuntu-os-cloud/ubuntu-minimal-2004-lts"
  networks = [
    {
      network               = dependency.vpc.outputs.network
      subnetwork            = dependency.subnet.outputs.subnetwork
      allow_internet_access = true
      network_tier          = "PREMIUM"
      nat_ip                = "34.101.139.164"
    }
  ]
}
