variable "ibmcloud_api_key" {
  description = "Denotes the IBM Cloud API key to use"
  default     = "<YOUR_API_KEY>"
}

variable "ibmcloud_region" {
  description = "Denotes which IBM Cloud region to connect to"
  default     = "mon"
}

variable "ibmcloud_zone" {
  description = "Denotes the zone within the region to connect to (only needed for multi-zone regions--e.g., eu-de-1)"
  default     = "mon01"
}

variable "vm_name" {
  description = "Name of the VM"
  default     = "demo-VM"
}

variable "power_instance_id" {
  description = "Power Virtual Server instance ID associated with your IBM Cloud account (note that this is NOT the API key)"
  default     = "<YOUR_SERVICE_GUID>"
}

variable "memory" {
  description = "Amount of memory (GB) to be allocated to the VM"
  default     = "4"
}

variable "processors" {
  description = "Number of virtual processors to allocate to the VM"
  default     = "1"
}

variable "proc_type" {
  description = "Processor type for the LPAR - shared/dedicated"
  default     = "shared"
}

variable "storage_type" {
  description = "The type of storage to attach to the LPAR (tier1/tier3)"
  default     = "tier3"
}

variable "ssh_key_name" {
  description = "SSH key name in IBM Cloud to be used for SSH logins"
  default     = "jwcroppe-mac"
}

variable "shareable" {
  description = "Should the data volume be shared or not - true/false"
  default     = "true"
}

variable "networks" {
  description = "List of networks that should be attached to the VM"
  default     = ["rdr-instana-net"]
}

variable "system_type" {
  description = "Type of system on which the VM should be created - s922/e880"
  default     = "s922"
}

variable "migratable" {
  description = "Can the VM be migrated - true/false"
  default     = "true"
}

variable "image_name" {
  description = "Name of the image from which the VM should be deployed"
  default     = "7200-05-01"
}

variable "replication_policy" {
  description = "Replication policy of the VM"
  default     = "none"
}

variable "replication_scheme" {
  description = "Replication scheme for the VM"
  default     = "suffix"
}

variable "replicants" {
  description = "Number of VM instances to deploy"
  default     = "1"
}
