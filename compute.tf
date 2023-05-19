
# image_source 
# ------ Get List Images
data "oci_core_images" "Okit_I_1684326487504Images" {
    compartment_id           = var.compartment_ocid
    operating_system         = "Windows"
    operating_system_version = "Server 2019 Standard"
    shape                    = "VM.Standard.E4.Flex"
}
locals {
    Okit_I_1684326487504_image_id = data.oci_core_images.Okit_I_1684326487504Images.images[0]["id"]
}

# ------ Create Instance
resource "oci_core_instance" "Okit_I_1684326487504" {
    # Required
    compartment_id      = local.Okit_C_1683111044621_id
    shape               = "VM.Standard.E4.Flex"
    # Optional
    display_name        = "QLME2FOUDWEB01"
    availability_domain = data.oci_identity_availability_domains.AvailabilityDomains.availability_domains["1" - 1]["name"]
    create_vnic_details {
        # Required
        subnet_id        = local.Okit_S_1682910700629_id
        # Optional
        assign_public_ip = false
        display_name     = "QLME2FOUDWEB01NIC"
        hostname_label   = "QLME2FOUDWEB01"
        nsg_ids          = [local.Okit_NSG_1682915198835_id,local.Okit_NSG_1682915211879_id,local.Okit_NSG_1682915215987_id,local.Okit_NSG_1684227031576_id]
        skip_source_dest_check = false
        freeform_tags    = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-6281a11d-6db9-44ec-84a4-adc554f970f9"}
    }
    metadata = {
        ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCMkXqiehJ/yGAfR8fNJXo1E/59QUfo1bYgoUVZRhBiEe7+Gepmf6VJofZxAC3MLFNupTMCvADk7WP6FNRgw7SmUDqE7JEt+I0iZvHO9ixSoYoi6fvgHaQLTfevFUs4LWyJ6j9ZhA7267k0mjCzxVqtpET0KScK5Bijyp5zOiNGR/q2NR/swuF5Dtmpm6JVGyRLB3zhSGtSB9Ljd1Gs1ld6fwmCuz/ctcWbYEnbP6pNhfUcx78tNgPWns3nowqNWoL3ibtXw37eD8UutGpOwo5DeyyT61/lIag3p59J3aUCrGWFEckheyqnac1kVCMB1c6c5X1J9cpk0GXdgZdqTyZh rsa-key-20220830"
    }
    shape_config {
        #Optional
        memory_in_gbs = "32"
        ocpus = "2"
    }
    source_details {
        # Required
        source_id               = local.Okit_I_1684326487504_image_id
        source_type             = "image"
        # Optional
        boot_volume_size_in_gbs = "50"
#        kms_key_id              = 
    }
    preserve_boot_volume = false
    freeform_tags              = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-6281a11d-6db9-44ec-84a4-adc554f970f9"}
}

data "oci_core_private_ips" "Okit_I_1684326487504_private_ip" {
    #Optional
    ip_address = oci_core_instance.Okit_I_1684326487504.private_ip
    subnet_id = local.Okit_S_1682910700629_id
}

locals {
    Okit_I_1684326487504_id               = oci_core_instance.Okit_I_1684326487504.id
    Okit_I_1684326487504_public_ip        = oci_core_instance.Okit_I_1684326487504.public_ip
    Okit_I_1684326487504_private_ip       = oci_core_instance.Okit_I_1684326487504.private_ip
    Okit_I_1684326487504_display_name     = oci_core_instance.Okit_I_1684326487504.display_name
    Okit_I_1684326487504_compartment_id   = oci_core_instance.Okit_I_1684326487504.compartment_id
    Okit_I_1684326487504_hostname         = "QLME2FOUDWEB01"
    Okit_I_1684326487504_primary_vnic_id  = data.oci_core_private_ips.Okit_I_1684326487504_private_ip.private_ips[0].vnic_id
}

output "Okit_I_1684326487504PublicIP" {
    value = [local.Okit_I_1684326487504_display_name, local.Okit_I_1684326487504_public_ip]
}

output "Okit_I_1684326487504PrivateIP" {
    value = [local.Okit_I_1684326487504_display_name, local.Okit_I_1684326487504_private_ip]
}

# ------ Create Block Storage Attachments

# ------ Create VNic Attachments


# image_source 
# ------ Get List Images
data "oci_core_images" "Okit_I_1684326489278Images" {
    compartment_id           = var.compartment_ocid
    operating_system         = "Windows"
    operating_system_version = "Server 2019 Standard"
    shape                    = "VM.Standard.E4.Flex"
}
locals {
    Okit_I_1684326489278_image_id = data.oci_core_images.Okit_I_1684326489278Images.images[0]["id"]
}

# ------ Create Instance
resource "oci_core_instance" "Okit_I_1684326489278" {
    # Required
    compartment_id      = local.Okit_C_1683111044621_id
    shape               = "VM.Standard.E4.Flex"
    # Optional
    display_name        = "QLME2FOUDWEB02"
    availability_domain = data.oci_identity_availability_domains.AvailabilityDomains.availability_domains["1" - 1]["name"]
    create_vnic_details {
        # Required
        subnet_id        = local.Okit_S_1682910700629_id
        # Optional
        assign_public_ip = false
        display_name     = "QLME2FOUDWEB02NIC"
        hostname_label   = "QLME2FOUDWEB02"
        nsg_ids          = [local.Okit_NSG_1682915198835_id,local.Okit_NSG_1682915211879_id,local.Okit_NSG_1682915215987_id,local.Okit_NSG_1684227031576_id]
        skip_source_dest_check = true
        freeform_tags    = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-13c93b29-1113-4b62-9074-3fb868732aaa"}
    }
    metadata = {
        ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCMkXqiehJ/yGAfR8fNJXo1E/59QUfo1bYgoUVZRhBiEe7+Gepmf6VJofZxAC3MLFNupTMCvADk7WP6FNRgw7SmUDqE7JEt+I0iZvHO9ixSoYoi6fvgHaQLTfevFUs4LWyJ6j9ZhA7267k0mjCzxVqtpET0KScK5Bijyp5zOiNGR/q2NR/swuF5Dtmpm6JVGyRLB3zhSGtSB9Ljd1Gs1ld6fwmCuz/ctcWbYEnbP6pNhfUcx78tNgPWns3nowqNWoL3ibtXw37eD8UutGpOwo5DeyyT61/lIag3p59J3aUCrGWFEckheyqnac1kVCMB1c6c5X1J9cpk0GXdgZdqTyZh rsa-key-20220830"
    }
    shape_config {
        #Optional
        memory_in_gbs = "32"
        ocpus = "2"
    }
    source_details {
        # Required
        source_id               = local.Okit_I_1684326489278_image_id
        source_type             = "image"
        # Optional
        boot_volume_size_in_gbs = "50"
#        kms_key_id              = 
    }
    preserve_boot_volume = false
    freeform_tags              = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-13c93b29-1113-4b62-9074-3fb868732aaa"}
}

data "oci_core_private_ips" "Okit_I_1684326489278_private_ip" {
    #Optional
    ip_address = oci_core_instance.Okit_I_1684326489278.private_ip
    subnet_id = local.Okit_S_1682910700629_id
}

locals {
    Okit_I_1684326489278_id               = oci_core_instance.Okit_I_1684326489278.id
    Okit_I_1684326489278_public_ip        = oci_core_instance.Okit_I_1684326489278.public_ip
    Okit_I_1684326489278_private_ip       = oci_core_instance.Okit_I_1684326489278.private_ip
    Okit_I_1684326489278_display_name     = oci_core_instance.Okit_I_1684326489278.display_name
    Okit_I_1684326489278_compartment_id   = oci_core_instance.Okit_I_1684326489278.compartment_id
    Okit_I_1684326489278_hostname         = "QLME2FOUDWEB02"
    Okit_I_1684326489278_primary_vnic_id  = data.oci_core_private_ips.Okit_I_1684326489278_private_ip.private_ips[0].vnic_id
}

output "Okit_I_1684326489278PublicIP" {
    value = [local.Okit_I_1684326489278_display_name, local.Okit_I_1684326489278_public_ip]
}

output "Okit_I_1684326489278PrivateIP" {
    value = [local.Okit_I_1684326489278_display_name, local.Okit_I_1684326489278_private_ip]
}

# ------ Create Block Storage Attachments

# ------ Create VNic Attachments

