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

# make ssh key details visible by using name in variables.tf
data ibm_is_ssh_key "ssh_key_id" {
  name = "${var.ssh_key}"
}

# Generating random ID
resource "random_uuid" "test" { }

resource "ibm_is_image" "vnf_custom_image" {
  depends_on       = ["random_uuid.test"]
  href             = "${var.vnf_cos_image_url}"
  name             = "${var.vnf_vpc_image_name}-${substr(random_uuid.test.result,0,8)}"
  operating_system = "ubuntu-16-04-amd64" 
  resource_group = "${data.ibm_resource_group.myrg.id}"

  timeouts {
    create = "30m"
    delete = "10m"
  }
}

data "ibm_is_subnet" "subnet1"{
   identifier = "${var.subnet_id}"
}

# create volumes for the Delphix VSI
resource "ibm_is_volume" "new_volume" {
  count = "${var.volumecount}"
  name = "${var.hostname}-${count.index + 1}"
  profile = "${var.volumeprofile}"
  zone = "${data.ibm_is_subnet.subnet1.zone}" 
  capacity = "${var.volumesize}"
}

resource "ibm_is_instance" "instance" {
  name    = "${var.hostname}"
  image   = "${ibm_is_image.vnf_custom_image.id}"
  profile = "${var.profile}"
  primary_network_interface {
    subnet          = "${data.ibm_is_subnet.subnet1.id}"
  }
  # resource_group = "${data.ibm_resource_group.myrg.id}"
  vpc       = "${data.ibm_is_vpc.myvpc.id}"
  zone = "${data.ibm_is_subnet.subnet1.zone}" 
  keys      = ["${data.ibm_is_ssh_key.ssh_key_id.id}"]
  volumes = ["${ibm_is_volume.new_volume.*.id}"]
}

resource "ibm_is_floating_ip" "fip1" {
  name   = "${var.hostname}-fip1"
  target = "${ibm_is_instance.instance.primary_network_interface.0.id}"
}

output "sshcommand" {
  value = "ssh root@${ibm_is_floating_ip.fip1.address}"
}
