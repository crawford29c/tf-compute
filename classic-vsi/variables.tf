variable "TF_VERSION" {
  default = "0.12"
  description = "terraform engine version to be used in schematics"
}

variable "ibmcloud_api_key" {
  # defined in tfvars
    description = "The user's IBM Cloud api key."
}
variable "ssh_key" {
  # defined in tfvars
  description = "The name of the public SSH key to be used when provisining Delphix VSI."
}

variable "iaas_classic_username" {
 # defined in tfvars
   description = "The user's classic infastructure user name."
}

variable "iaas_classic_api_key" {
  # defined in tfvars
    description = "The account's classic infastructure api key."
}

variable "hostname" {
  # default region to be used
    default = "vm1"
    description = "The name of your Delphix Virtual Server to be provisioned."
}

variable "region" {
  # default region to be used
    default = "us-south"
    description = "Optional. The value of the region of VPC."
}

variable "profile" {
  # default compute profile to be used
    default = "mx2-16x128"
    description = "The profile of compute CPU and memory resources to be used when provisioning the Delphix VSI. For a list of available profiles, visit https://cloud.ibm.com/docs/vpc?topic=vpc-profiles"
}

variable "volumecount" {
  # default volume count
    default = "1"
    description = "The number of block storage volumes to create for the Delphix VSI."
}

variable "volumeprofile" {
  # default volume profile to be used
    default = "10iops-tier"
    description = "The block storage profile to use. The default uses the 10 IOPS/GB tier for the most demanding workloads. For more information on volume profiles, visit https://cloud.ibm.com/docs/vpc?topic=vpc-block-storage-profiles"
}

variable "volumesize" {
  # default volume size to be used
    default = "25"
    description = "The block storage volume size in GB. Enter a size between 10 and 2000 GB."
}

variable "vpcname" {
  # default vpc name to be used
  default = "delphix-vpc"
  description = "The name of your VPC where the Delphix  VSI is to be provisioned."
}
variable "zone" {
  default     = "us-south-1"
  description = "The VPC Zone that you want your VPC networks and virtual servers to be provisioned in. To list available zones, run `ibmcloud is zones`."
}

variable "resource_group" {
  # use default or whatever valid resource name in your account
  default = "default"
  description = "Optional. The value of the resource group of VPC."
}

variable "vnf_cos_image_url" {
  default     = "cos://us-south/delphix-images/Delphix_6.0.0.0_2020-01-17-16-36_Standard_KVM.qcow2"
  description = "The COS image object SQL URL for Delphix image."
}

variable "vnf_vpc_image_name" {
  default     = "delphix-ga6"
  description = "The name of the custom image to be provisioned in your IBM Cloud account."
}

variable "subnet_id" {
  default = ""
  description = "The id of the subnet where the Delhpix VSI is to be provisioned."
}
