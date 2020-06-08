provider "ibm" {
  ibmcloud_api_key   = var.ibmcloud_api_key
  region             = "us-south"
  iaas_classic_username = var.iaas_classic_username
  iaas_classic_api_key  = var.iaas_classic_api_key
}

