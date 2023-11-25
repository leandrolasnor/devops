# Outputs for compute instance

locals {
  instances_details = [
    // display name, Primary VNIC Public/Private IP for each instance
    for i in oci_core_instance.ubuntu_instance : <<EOT
      ${~i.display_name~}
      Primary-PublicIP: %{if i.public_ip != ""}${i.public_ip~}%{else}N/A%{endif~}
      Primary-PrivateIP: ${i.private_ip~}
      Memory: ${i.shape_config[0].memory_in_gbs~}
      OCPU: ${i.shape_config[0].ocpus~}
    EOT
  ]
}

output "instances_summary" {
  description = "Private and Public IPs for each instance."
  value       = local.instances_details
}

output "public-ip-for-compute-instance" {
  value = oci_core_instance.ubuntu_instance.*.public_ip
}

output "instance-name" {
  value = oci_core_instance.ubuntu_instance.*.display_name
}

output "instance-OCID" {
  value = oci_core_instance.ubuntu_instance.*.id
}

output "instance-region" {
  value = oci_core_instance.ubuntu_instance.*.region
}

output "instance-shape" {
  value = oci_core_instance.ubuntu_instance.*.shape
}

output "instance-state" {
  value = oci_core_instance.ubuntu_instance.*.state
}

output "time-created" {
  value = oci_core_instance.ubuntu_instance.*.time_created
}

output "dns" {
  value = data.oci_dns_rrset.dns
}