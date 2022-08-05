provider "ibm" {
  region    =   "lon"
  zone      =   "lon04"
}

resource "ibm_pi_instance" "test-instance" {
    pi_memory             = "4"
    pi_processors         = "2"
    pi_instance_name      = "test-vm"
    pi_proc_type          = "shared"
    pi_image_id           = "8810d643-5d62-46cb-bfc4-8c9593e4f7c0"
    pi_key_pair_name      = ibm_pi_key.key.key_id
    pi_sys_type           = "s922"
    pi_cloud_instance_id  = "51e1879c-bcbe-4ee1-a008-49cdba0eaf60"
    pi_pin_policy         = "none"
    pi_health_status      = "WARNING"
    pi_network {
      network_id = data.ibm_pi_public_network.dsnetwork.id
    }
}
