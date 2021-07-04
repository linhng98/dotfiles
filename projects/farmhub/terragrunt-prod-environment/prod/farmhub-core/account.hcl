# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  project    = "${basename(get_terragrunt_dir())}"
  project_id = "${basename(get_terragrunt_dir())}"
  bucket     = "terragrunt-state-${basename(get_terragrunt_dir())}"
}
