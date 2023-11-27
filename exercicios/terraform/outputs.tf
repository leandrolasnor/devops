# Outputs for compute instance

locals {
  instances = {
    "rancher-server :: ${oci_core_instance.rancher-server.state}": {
      "Name": oci_core_instance.rancher-server.display_name,
      "PublicIP": oci_core_instance.rancher-server.public_ip,
      "PrivateIP": oci_core_instance.rancher-server.private_ip,
      "Memory": oci_core_instance.rancher-server.shape_config[0].memory_in_gbs,
      "CPU": oci_core_instance.rancher-server.shape_config[0].ocpus
    },
    "k8s-1 :: ${oci_core_instance.k8s-1.state}": {
      "Name": oci_core_instance.k8s-1.display_name,
      "PublicIP": oci_core_instance.k8s-1.public_ip,
      "PrivateIP": oci_core_instance.k8s-1.private_ip,
      "Memory": oci_core_instance.k8s-1.shape_config[0].memory_in_gbs,
      "CPU": oci_core_instance.k8s-1.shape_config[0].ocpus
    },
    "k8s-2 :: ${oci_core_instance.k8s-2.state}": {
      "Name": oci_core_instance.k8s-2.display_name,
      "PublicIP": oci_core_instance.k8s-2.public_ip,
      "PrivateIP": oci_core_instance.k8s-2.private_ip,
      "Memory": oci_core_instance.k8s-2.shape_config[0].memory_in_gbs,
      "CPU": oci_core_instance.k8s-2.shape_config[0].ocpus
    }
  }
}

output "instances" {
  description = "Instances Summary"
  value       = local.instances
}

output "dns" {
  value = data.oci_dns_rrset.dns
}