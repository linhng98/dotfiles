terraform {
  source = "git::https://gitlab.com/ln-terraform/gcp/google-compute-instance.git//"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../../../vpc/farmhub"
}

dependency "subnet" {
  config_path = "../../../subnet/farmhub/public-subnetwork-asia-southeast2"
}

dependency "grafana_pd" {
  config_path = "../../../disks/grafana"
}

dependency "prometheus_pd" {
  config_path = "../../../disks/prometheus"
}

inputs = {
  name         = "grafana-prometheus"
  zone         = "asia-southeast2-a"
  machine_type = "g1-small"

  scheduling = {
    preemptible       = false
    automatic_restart = true
  }
  tags = [
    "${dependency.vpc.outputs.network_name}-allow-ssh",
    "${dependency.vpc.outputs.network_name}-allow-http",
  ]
  image_type = "ubuntu-os-cloud/ubuntu-minimal-2004-lts"
  networks = [
    {
      network               = dependency.vpc.outputs.network
      subnetwork            = dependency.subnet.outputs.subnetwork
      allow_internet_access = true
      network_tier          = "PREMIUM"
    }
  ]
  attached_disks = [
    {
      source      = dependency.grafana_pd.outputs.self_link,
      device_name = "sdb",
      mode        = "READ_WRITE"
    },
    {
      source      = dependency.prometheus_pd.outputs.self_link,
      device_name = "sdc",
      mode        = "READ_WRITE"
    },
  ]

  metadata_startup_script = <<EOF
    sdb1=`sudo fdisk -l | grep sdb1`
    if [ -z "$sdb1"]; then
      echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdb
      sudo mkfs.ext4 /dev/sdb1
    fi

    sdc1=`sudo fdisk -l | grep sdc1`
    if [ -z "$sdc1"]; then
      echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdc
      sudo mkfs.ext4 /dev/sdc1
    fi

    sudo mkdir -p /var/lib/grafana
    sudo mkdir -p /var/lib/prometheus
    sudo mount /dev/sdb1 /var/lib/grafana
    sudo mount /dev/sdc1 /var/lib/prometheus
  EOF
}
