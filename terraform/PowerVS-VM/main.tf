## Template to be used by the IBM Provider for Power Systems

terraform {
  required_version = ">=1.0.0, <2.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.44.0"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.ibmcloud_region
  zone             = "${var.ibmcloud_zone}"
}

data "ibm_pi_network" "power_networks" {
  count                = length(var.networks)
  pi_network_name      = var.networks[count.index]
  pi_cloud_instance_id = var.power_instance_id
}

data "ibm_pi_image" "power_images" {
  pi_image_name        = var.image_name
  pi_cloud_instance_id = var.power_instance_id
}

resource "ibm_pi_instance" "pvminstance" {
  pi_memory               = var.memory
  pi_processors           = var.processors
  pi_instance_name        = var.vm_name
  pi_proc_type            = var.proc_type
  pi_storage_type         = var.storage_type
  pi_migratable           = var.migratable
  pi_image_id             = data.ibm_pi_image.power_images.id
  pi_volume_ids           = []
  pi_network { network_id = data.ibm_pi_network.power_networks.0.id }
  pi_key_pair_name        = var.ssh_key_name
  pi_sys_type             = var.system_type
  pi_replication_policy   = var.replication_policy
  pi_replication_scheme   = var.replication_scheme
  pi_replicants           = var.replicants
  pi_cloud_instance_id    = var.power_instance_id
}
