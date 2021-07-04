terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-compute-instance.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../../vpc/farmhub"
}

inputs = {
  name         = "exporter-agent"
  zone         = "asia-southeast2-a"
  machine_type = "g1-small"

  scheduling = {
    preemptible       = false
    automatic_restart = true
  }
  tags = [
    "${dependency.vpc.outputs.network_name}-allow-ssh",
    "${dependency.vpc.outputs.network_name}-allow-all",
  ]
  image_type = "ubuntu-os-cloud/ubuntu-minimal-2004-lts"
  networks = [
    {
      network               = dependency.vpc.outputs.network
      subnetwork            = dependency.vpc.outputs.public_subnetwork
      allow_internet_access = false
      network_tier          = "PREMIUM"
    }
  ]
}
