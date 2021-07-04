terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-k8s-engine.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "gke_node_sa" {
  config_path = "../../service-account/gke-node"
}

dependency "subnet" {
  config_path = "../../subnet/farmhub/public-subnetwork-asia-southeast2"
}

dependency "vpc" {
  config_path = "../../vpc/farmhub"
}

locals {
  cluster_name       = "farmhub-cluster"
  min_master_version = "1.19.9-gke.1900"
  zone               = "asia-southeast2-a"
}

inputs = {
  cluster_name       = local.cluster_name
  min_master_version = local.min_master_version
  location           = local.zone
  network = dependency.vpc.outputs.network
  subnetwork         = dependency.subnet.outputs.subnetwork

  ip_allocation_policy = {
    cluster_secondary_range_name = "${dependency.subnet.outputs.subnetwork_name}-secondary-range"
  }

  node_pools = [
    {
      name            = format("%s-pool-1", local.cluster_name)
      node_count      = 2
      preemptible     = true
      machine_type    = "n1-standard-2"
      service_account = dependency.gke_node_sa.outputs.service_account_email
    },
    {
      name            = format("%s-pool-2", local.cluster_name)
      node_count      = 2
      preemptible     = true
      machine_type    = "n1-standard-2"
      service_account = dependency.gke_node_sa.outputs.service_account_email
    },
  ],

  node_pools_tags = {
    all = [
      local.cluster_name,
      "${dependency.vpc.outputs.network_name}-allow-monitor",
      "${dependency.vpc.outputs.network_name}-allow-ssh",
      "${dependency.vpc.outputs.network_name}-allow-ping",
    ],
    format("%s-pool-1", local.cluster_name) = [
      format("%s-pool-1", local.cluster_name)
    ],
    format("%s-pool-2", local.cluster_name) = [
      format("%s-pool-2", local.cluster_name)
    ],
  },
}
