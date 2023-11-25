data "oci_dns_rrset" "dns" {
    #Required
    domain = var.domain
    rtype = var.typeA
    zone_name_or_id = var.dns_zone_id

    #Optional
    compartment_id = var.compartment_id
}