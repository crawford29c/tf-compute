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
name  = "{$var.ihostname}"
vpc     = "${var.vpcname}"
image   = "${data.ibm_is_image.image_id.id}"
profile = "${var.profile}"
}
