# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  # Automatically load account-level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract the variables we need for easy access
  project_id = local.account_vars.locals.project_id
  bucket     = local.account_vars.locals.bucket
  env        = local.environment_vars.locals.environment
}

# Generate an google provider block
generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite"

  contents = <<EOF
provider "google" {
  project = "${local.project_id}"
}
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.60.0"
    }
  }
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in a bucket
remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    prefix   = "${path_relative_to_include()}/terraform.tfstate"
    bucket   = local.bucket
    project  = local.project_id
    location = "asia-southeast2"
  }
}

terraform_version_constraint = ">= 0.14.0"


# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.

inputs = merge(
  local.account_vars.locals,
  local.environment_vars.locals,
)
