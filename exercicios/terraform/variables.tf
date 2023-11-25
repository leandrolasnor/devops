variable "ssh_public_key_path" {
  type        = string
  description = "The SSH public key path to use when configuring access to any compute resources created as part of this deployment"
  default = "~/.ssh/oci.pub"
}

variable "ssh_private_key_file" {
  type        = string
  description = "THe SSH private key path that goes with the SSH public key that is used when accessing compute resources that are created as part of this deployment"
  default = "~/.ssh/oci"
}

variable "instances_count" {
  type = number
  description = "Count of instances"
  default = 3
}

variable "compartment_id" {
  type = string
  description = "Compartiment OCID"
  default = "ocid1.compartment.oc1..aaaaaaaanfutlss2ndwqusftp5yz3g2oaxgf3zvbzsbxc2n4a5aq3nrlynsa"
}

variable "dns_zone_id" {
  type = string
  description = "Zone OCID"
  default = "ocid1.dns-zone.oc1..aaaaaaaalglnlvvuizbyt22ir2wbrsx37w2zdktwdzymixn7gzjptbelwnja"
}

variable "domain" {
  type = string
  description = "Domain"
  default = "rancher.ronsal.com.br"
}

variable "typeA" {
  type = string
  description = "Type of record "
  default = "A"
}

variable "typeCNAME" {
  type = string
  description = "Type of record "
  default = "CNAME"
}

variable "typePRIMARY" {
  type = string
  description = "Type of record "
  default = "PRIMARY"
}

variable "rrset_items_ttl" {
  type = number
  description = "The Time To Live for the record, in seconds"
  default = 3600
}

variable "region" {
  type = string
  description = "Availabolity domain"
  default = "sa-saopaulo-1"
}