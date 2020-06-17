# provider configuration parameters/variables
provider "ibm" {
  ibmcloud_api_key   = "${var.ibmcloud_api_key}"
  generation = 2
  region             = "${var.region}"
  iaas_classic_username = "${var.iaas_classic_username}" 
  iaas_classic_api_key  = "${var.iaas_classic_api_key}" 
}

# make OS image details visible by using name in variables.tf
data ibm_is_image "image_id" {
  name = "${var.image}"
}

resource "ibm_is_instance" "new_vsi" {
name  = "{$var.hostname}"
vpc     = "${var.vpcname}"
keys    = ["${data.ibm_is_ssh_key.ssh_key_id.id}"]
zone    = "${var.region}-1"
image   = "${data.ibm_is_image.image_id.id}"
profile = "${var.profile}"
}

resource "ibm_is_floating_ip" "fip1" {
  name   = "${local.BASENAME}-fip1"
  target = ibm_is_instance.new_vsi.primary_network_interface[0].id
}

output "sshcommand" {
  value = "ssh root@ibm_is_floating_ip.fip1.address"
}
