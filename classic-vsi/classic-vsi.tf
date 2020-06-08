# provider configuration parameters/variables
provider "ibm" {
  ibmcloud_api_key   = var.ibmcloud_api_key
  region             = "us-south"
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key
}

resource "ibm_compute_vm_instance" "vm1" {
hostname             = "vm1"
domain               = "example.com"
os_reference_code    = "DEBIAN_8_64"
datacenter           = "dal10"
network_speed        = 10
hourly_billing       = true
private_network_only = false
cores                = 1
memory               = 1024
disks                = [25]
local_disk           = false
}
