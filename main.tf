
# ------ Create Policy
resource "oci_identity_policy" "Okit_P_1682910646866" {
    provider       = oci.home_region
    #Required
    compartment_id = local.DeploymentCompartment_id
    description = "cloudadmin"
    name = "cloudadmin"
    statements = ["Allow group cloudadmins to manage groups in tenancy where target.group.name!='Administrators'","Allow group cloudadmins to manage all-resources in tenancy where target.group.name!='Administrators'","Allow group cloudadmins to inspect policies in tenancy","Allow group cloudadmins to inspect tag-namespaces in tenancy where target.group.name!='Administrators'","Allow group cloudadmins to manage compartments in tenancy where target.group.name!='Administrators'"]
#    statements = ["Allow group cloudadmins to manage groups in tenancy where target.group.name!='Administrators'", "Allow group cloudadmins to manage all-resources in tenancy where target.group.name!='Administrators'", 'Allow group cloudadmins to inspect policies in tenancy', "Allow group cloudadmins to inspect tag-namespaces in tenancy where target.group.name!='Administrators'", "Allow group cloudadmins to manage compartments in tenancy where target.group.name!='Administrators'"]

    #Optional
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-54c3be06-9060-4e6c-9aab-5f93ae39ab92"}
}

locals {
    Okit_P_1682910646866_id              = oci_identity_policy.Okit_P_1682910646866.id
}


# ------ Create Policy
resource "oci_identity_policy" "Okit_P_1682910649467" {
    provider       = oci.home_region
    #Required
    compartment_id = local.DeploymentCompartment_id
    description = "useradmin"
    name = "useradmin"
    statements = ["allow group useradmin to manage users in tenancy ","allow group useradmin to manage groups in tenancy"]
#    statements = ['allow group useradmin to manage users in tenancy ', 'allow group useradmin to manage groups in tenancy']

    #Optional
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-251757f8-56a7-4386-89a3-cbffc0cda311"}
}

locals {
    Okit_P_1682910649467_id              = oci_identity_policy.Okit_P_1682910649467.id
}


# ------ Create Policy
resource "oci_identity_policy" "Okit_P_1682910652030" {
    provider       = oci.home_region
    #Required
    compartment_id = local.DeploymentCompartment_id
    description = "tag_admin"
    name = "tag_admin"
    statements = ["allow group tag_admin to manage tag-defaults in tenancy"]
#    statements = ['allow group tag_admin to manage tag-defaults in tenancy']

    #Optional
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-d21b18d4-77df-4a6f-8131-bb8f92678a8d"}
}

locals {
    Okit_P_1682910652030_id              = oci_identity_policy.Okit_P_1682910652030.id
}


# ------ Create Policy
resource "oci_identity_policy" "Okit_P_1682910657621" {
    provider       = oci.home_region
    #Required
    compartment_id = local.Okit_C_1682910617265_id
    description = "networkadmin"
    name = "networkadmin"
    statements = ["allow group netwokadmins to manage virtual-network-family in compartment COMP_N_SS"]
#    statements = ['allow group netwokadmins to manage virtual-network-family in compartment COMP_N_SS']

    #Optional
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-5d01d719-aee3-452f-ae8b-c2592a56fe43"}
}

locals {
    Okit_P_1682910657621_id              = oci_identity_policy.Okit_P_1682910657621.id
}


# ------ Create Policy
resource "oci_identity_policy" "Okit_P_1684151234822" {
    provider       = oci.home_region
    #Required
    compartment_id = local.Okit_C_1682910617265_id
    description = "GENCOMPUTEADMIN"
    name = "GENCOMPUTEADMIN"
    statements = ["Allow group GENCOMPUTEADMIN to manage GENCOMPUTEADMIN in compartment COMP_N_GEN"]
#    statements = ['Allow group GENCOMPUTEADMIN to manage GENCOMPUTEADMIN in compartment COMP_N_GEN']

    #Optional
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-5b507176-b44c-4df3-89f2-98031f5b7fed"}
}

locals {
    Okit_P_1684151234822_id              = oci_identity_policy.Okit_P_1684151234822.id
}

