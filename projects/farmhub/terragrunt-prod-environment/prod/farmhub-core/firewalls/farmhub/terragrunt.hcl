terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-cloud-firewall-rule.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../vpc/farmhub"
}

locals {
  prefix = "terraform"
}

inputs = {
  network      = dependency.vpc.outputs.network
  prefix_allow = "terraform"

  allow_rules = [
    {
      name          = "${dependency.vpc.outputs.network_name}-allow-all"
      direction     = "INGRESS"
      source_tags   = []
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["${dependency.vpc.outputs.network_name}-allow-all"]
      ports         = []
      protocol      = "TCP"
    },
    {
      name          = "${dependency.vpc.outputs.network_name}-allow-ping"
      direction     = "INGRESS"
      source_tags   = []
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["${dependency.vpc.outputs.network_name}-allow-ping"]
      ports         = []
      protocol      = "ICMP"
    },
    {
      name          = "${dependency.vpc.outputs.network_name}-allow-ssh"
      direction     = "INGRESS"
      source_tags   = []
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["${dependency.vpc.outputs.network_name}-allow-ssh"]
      ports         = ["22"]
      protocol      = "TCP"
    },
    {
      name          = "${dependency.vpc.outputs.network_name}-allow-http"
      direction     = "INGRESS"
      source_tags   = []
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["${dependency.vpc.outputs.network_name}-allow-http"]
      ports         = ["80", "443"]
      protocol      = "TCP"
    },
    {
      name          = "${dependency.vpc.outputs.network_name}-allow-wireguard"
      direction     = "INGRESS"
      source_tags   = []
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["${dependency.vpc.outputs.network_name}-allow-wireguard"]
      ports         = ["51820"]
      protocol      = "UDP"
    },
    {
      name          = "${dependency.vpc.outputs.network_name}-allow-admission"
      direction     = "INGRESS"
      source_tags   = []
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["farmhub-cluster"]
      ports         = ["9443", "8443"]
      protocol      = "TCP"
    },
  ]
}