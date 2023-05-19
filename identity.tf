
# ------ Root Compartment
locals {
    DeploymentCompartment_id              = var.compartment_ocid
}

output "DeploymentCompartmentId" {
    value = local.DeploymentCompartment_id
}

# ------ Create Compartment - Root False
# ------ Create Compartment
resource "oci_identity_compartment" "Okit_C_1682910617265" {
    provider       = oci.home_region
    #Required
    compartment_id = local.DeploymentCompartment_id
    description = "ME2_N_B1_COMP"
    name   = "COMP_N_SS"

    #Optional
        freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-5b14f41b-5e67-49bb-b5bf-ef3ad2f251c1"}
    enable_delete = false
}

locals {
    Okit_C_1682910617265_id = oci_identity_compartment.Okit_C_1682910617265.id
}

output "Okit_C_1682910617265Id" {
    value = local.Okit_C_1682910617265_id
}

# ------ Create Compartment - Root False
# ------ Create Compartment
resource "oci_identity_compartment" "Okit_C_1683111044621" {
    provider       = oci.home_region
    #Required
    compartment_id = local.DeploymentCompartment_id
    description = "ME2_N_GEN_COMP"
    name   = "COMP_N_GEN"

    #Optional
        freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-fd9f658e-33fe-4bfd-ba83-4f76bb260416"}
    enable_delete = false
}

locals {
    Okit_C_1683111044621_id = oci_identity_compartment.Okit_C_1683111044621.id
}

output "Okit_C_1683111044621Id" {
    value = local.Okit_C_1683111044621_id
}

# ------ Create Compartment - Root False
# ------ Create Compartment
resource "oci_identity_compartment" "Okit_C_1683111050698" {
    provider       = oci.home_region
    #Required
    compartment_id = local.DeploymentCompartment_id
    description = "ME2_N_TL_COMP"
    name   = "COMP_N_TL"

    #Optional
        freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-e8a0560a-0b32-46a5-9569-e3a79a704028"}
    enable_delete = false
}

locals {
    Okit_C_1683111050698_id = oci_identity_compartment.Okit_C_1683111050698.id
}

output "Okit_C_1683111050698Id" {
    value = local.Okit_C_1683111050698_id
}

# ------ Create User Group
resource "oci_identity_group" "Okit_G_1683205411765" {
    provider       = oci.home_region
    #Required
    compartment_id = var.tenancy_ocid
    description = "User Group okitgrp239"
    name = "testgroup"

    #Optional
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-924aa2e5-4de7-4967-8835-3b1a52409201"}
}

locals {
    Okit_G_1683205411765_id              = oci_identity_group.Okit_G_1683205411765.id
}
# ------- Add Members


# ------ Create User
resource "oci_identity_user" "Okit_U_1683205397404" {
    provider       = oci.home_region
    #Required
    compartment_id = var.tenancy_ocid
    description = "okitusr238"
    name = "testuser"

    #Optional
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-0c1ea388-280c-4c50-bebf-602ae55f11d3"}
}

locals {
    Okit_U_1683205397404_id              = oci_identity_user.Okit_U_1683205397404.id
}
# ------- Create Password
resource "oci_identity_ui_password" "Okit_U_1683205397404Password" {
    provider       = oci.home_region
    #Required
    user_id = oci_identity_user.Okit_U_1683205397404.id
}

