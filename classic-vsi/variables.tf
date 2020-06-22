variable "ibmcloud_api_key" {
  # defined in tfvars
}
variable "ssh_key" {
  # defined in tfvars
}

variable "iaas_classic_username" {
 # defined in tfvars
}

variable "iaas_classic_api_key" {
  # defined in tfvars
}

variable "hostname" {
  # default region to be used
    default = "vm1"
}

variable "region" {
  # default region to be used
    default = "us-south"
}

variable "image" {
  # Delphix OS image to be used
    default = "delphix-ga6"
}

variable "profile" {
  # default compute profile to be used
    default = "mx2-16x128"
}

variable "volumecount" {
  # default volume count
    default = "1"
}

variable "volumeprofile" {
  # default volume profile to be used
    default = "10iops-tier"
}

variable "volumesize" {
  # default volume size to be used
    default = "25"
}

variable "vpcname" {
  # default vpc name to be used
  default = "delphix-vpc"
}
variable "zone" {
  default     = "us-south-1"
  description = "The VPC Zone that you want your VPC networks and virtual servers to be provisioned in. To list available zones, run `ibmcloud is zones`."
}

variable "resource_group" {
  # use default or whatever valid resource name in your account
  default = "default"
}

variable "vnf_cos_image_url" {
  default     = "cos://us-south/delphix-images/Delphix_6.0.0.0_2020-01-17-16-36_Standard_KVM.qcow2"
  description = "The COS image object SQL URL for Delphix image."
}

