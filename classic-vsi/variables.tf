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
variable "resource_group" {
  # use default or whatever valid resource name in your account
  default = "default"
}
