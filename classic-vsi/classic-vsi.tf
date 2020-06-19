# provider configuration parameters/variables
provider "ibm" {
  ibmcloud_api_key   = "${var.ibmcloud_api_key}"
  generation = 2
  region             = "${var.region}"
  iaas_classic_username = "${var.iaas_classic_username}"
  iaas_classic_api_key  = "${var.iaas_classic_api_key}"
}

data "ibm_is_vpc" "myvpc" {
    name = "${var.vpcname}"
}
data "ibm_resource_group" "myrg" {
    name = "${var.resource_group}"
}
# make OS image details visible by using name in variables.tf
data ibm_is_image "image_id" {
  name = "${var.image}"
}
# make ssh key details visible by using name in variables.tf
data ibm_is_ssh_key "ssh_key_id" {
  name = "${var.ssh_key}"
}

resource "ibm_is_instance" "instance" {
  name    = "${var.hostname}"
  image   = "${data.ibm_is_image.image_id.id}"
  profile = "${var.profile}"
  primary_network_interface {
    subnet          = "${data.ibm_is_vpc.myvpc.subnets.0.id}"
  }
  # resource_group = "${data.ibm_resource_group.myrg.id}"
  vpc       = "${data.ibm_is_vpc.myvpc.id}"
  zone    = "${var.region}-1"
  keys      = ["${data.ibm_is_ssh_key.ssh_key_id.id}"]
}
