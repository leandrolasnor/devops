data "template_file" "k8s-1-cloud-config" {
    template = "${file("./cloud-config/cloud-config.yaml")}"
    vars = {
        setup = "${base64encode(file("./cloud-config/setup.sh"))}"
    }
}

resource "oci_core_instance" "k8s-1" {
    # Required
    display_name = "k8s-1"
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = "ocid1.compartment.oc1..aaaaaaaanfutlss2ndwqusftp5yz3g2oaxgf3zvbzsbxc2n4a5aq3nrlynsa"
    shape = "VM.Standard.E3.Flex"
    shape_config {
        ocpus = 4
        memory_in_gbs = 8
    }
    source_details {
        source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaaqqu7h5rkavka5z2343l64qdfp445c6wyfbmvrphmoy4377xa4aa"
        source_type = "image"
        boot_volume_size_in_gbs = 50
    }
    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaamtlphhnbskdgzrusk5af4agz4htyfdxdhrdwi2co4cctmhbbnhpa"
    }
    metadata = {
        ssh_authorized_keys = file("~/.ssh/oci.pub")
        user_data = "${base64encode(data.template_file.k8s-1-cloud-config.rendered)}"
    }
}
