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
    name = "default"
}
resource "ibm_is_instance" "instance" {
  name    = "${var.hostname}"
  image   = "${var.image}"
  profile = "${var.profile}"
  primary_network_interface {
    subnet          = ["${element((data.ibm_is_vpc.myvpc.subnets.*.id), 0)}"]
  }
  resource_group = "${data.ibm_resource_group.myrg.id}"
  vpc       = "${data.ibm_is_vpc.myvpc.id}"
  zone    = "${var.region}-1"
  keys      = ["${var.ssh_key}"]
}
