provider "ibm" {
  region    =   "lon"
  zone      =   "lon04"
}

module "camtags" {
  source = "../Modules/camtags"
}

variable "public_ssh_key" {
  description = "Public SSH key used to connect to the virtual guest"
}

variable "datacenter" {
  description = "Softlayer datacenter where infrastructure resources will be deployed"
  default     = "dal12"
}

variable "hostname" {
  description = "Hostname of the virtual instance (small flavor) to be deployed"
  default     = "benvm2"
}

variable "os_reference_code" {
  type = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
  default = "7300-00-01"
}
  
resource "ibm_pi_instance" "test-instance" {
    pi_memory             = "4"
    pi_processors         = "2"
    pi_instance_name      = "benvm2"
    pi_proc_type          = "shared"
    pi_image_id           = "8810d643-5d62-46cb-bfc4-8c9593e4f7c0"
    pi_key_pair_name      = ibm_pi_key.key.key_id
    pi_sys_type           = "s922"
    pi_cloud_instance_id  = "979bceac138e4c33861cccf92f224662"
    pi_pin_policy         = "none"
    pi_health_status      = "WARNING"
    pi_network {
      network_id = data.ibm_pi_public_network.dsnetwork.id
    }
}
