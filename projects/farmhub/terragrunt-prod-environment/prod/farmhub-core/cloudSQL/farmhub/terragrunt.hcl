terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-cloud-sql.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../vpc/farmhub"
}

locals {
  name   = "farmhub-postgres"
  region = "asia-southeast2"
}

inputs = {
  name                = local.name
  region              = local.region
  tier                = "db-custom-1-6656"
  root_password       = "RandomStronkPassword"
  availability_type   = "ZONAL"
  deletion_protection = false
  number_replicas     = 0
  database_version    = "POSTGRES_13"

  backup_configuration = {
    enabled                        = true
    binary_log_enabled             = false
    start_time                     = "00:00"
    transaction_log_retention_days = 7
  }

  ip_configuration = {
    ipv4_enabled    = false
    private_network = dependency.vpc.outputs.network
    require_ssl     = false
  }

  maintenance_window = {
    day  = 7
    hour = 0
  }

  replica_configuration = {
    failover_target         = false
    master_heartbeat_period = 500
  }
}