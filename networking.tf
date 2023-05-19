
# ------ Create Dhcp Options
# ------- Update VCN Default DHCP Option
resource "oci_core_default_dhcp_options" "Okit_DO_1682910673194" {
    # Required
    manage_default_resource_id = local.Okit_VCN_1682910673137_default_dhcp_options_id
    options    {
        type  = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }
    options    {
        type  = "SearchDomain"
        search_domain_names      = ["vcnme2ngen.oracelvcn.com"]
    }
    # Optional
    display_name   = "Default DHCP Options for VCN_ME2_N_GEN"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-cc66f3e8-9963-4a01-a445-911a69cdc4ed"}
}

locals {
    Okit_DO_1682910673194_id = oci_core_default_dhcp_options.Okit_DO_1682910673194.id
    }


# ------ Create Dhcp Options
# ------- Update VCN Default DHCP Option
resource "oci_core_default_dhcp_options" "Okit_DO_1682910676178" {
    # Required
    manage_default_resource_id = local.Okit_VCN_1682910676159_default_dhcp_options_id
    options    {
        type  = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }
    options    {
        type  = "SearchDomain"
        search_domain_names      = ["vcnme2pss.oraclevcn.com"]
    }
    # Optional
    display_name   = "Default DHCP Options for VCN_ME2_N_SS"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-5c848aff-e087-4e37-9683-5d26825b7849"}
}

locals {
    Okit_DO_1682910676178_id = oci_core_default_dhcp_options.Okit_DO_1682910676178.id
    }


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682915192678" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910673137_id
    # Optional
    display_name   = "NSG_ME2_N_GEN_Linux"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-a3ee218e-f381-4df6-b7ed-1bf73666f1cb"}
}

locals {
    Okit_NSG_1682915192678_id = oci_core_network_security_group.Okit_NSG_1682915192678.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683181340652Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915192678_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "CyberArk / Jump host on SSH"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "10.2.0.6/31"
        tcp_options {
            destination_port_range {
            min = "22"
            max = "22"
            }
        }
}

locals {
    Okit_NSG_1683181340652Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683181340652Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683181343353Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915192678_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Dynatrace"
        destination = "10.2.0.1/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1683181343353Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683181343353Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684218199924Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915192678_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Dynatrace"
        destination = "10.2.0.2/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1684218199924Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684218199924Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684218248293Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915192678_id
    direction    = "EGRESS"
    protocol    = "17"
    # Optional
    description   = "Syslog to Splunk"
        destination = "10.2.0.4/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        udp_options {
            destination_port_range {
            min = "514"
            max = "514"
            }
        }
}

locals {
    Okit_NSG_1684218248293Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684218248293Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684218306418Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915192678_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Syslog to Splunk"
        destination = "10.2.0.4/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "6514"
            max = "6514"
            }
        }
}

locals {
    Okit_NSG_1684218306418Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684218306418Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682915198835" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910673137_id
    # Optional
    display_name   = "NSG_ME2_N_GEN_WIN"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-cda51fce-1bd3-4486-b749-363d785fd2e2"}
}

locals {
    Okit_NSG_1682915198835_id = oci_core_network_security_group.Okit_NSG_1682915198835.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683182461407Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915198835_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "CyberArk / Jump host on RDP"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "10.2.0.6/31"
        tcp_options {
            destination_port_range {
            min = "3389"
            max = "3389"
            }
        }
}

locals {
    Okit_NSG_1683182461407Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683182461407Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683197228867Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915198835_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Dynatrace"
        destination = "10.2.0.1/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1683197228867Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683197228867Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684218472021Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915198835_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Dynatrace"
        destination = "10.2.0.2/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1684218472021Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684218472021Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684218493261Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915198835_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Splunk forwarder"
        destination = "10.2.0.4/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "9997"
            max = "9997"
            }
        }
}

locals {
    Okit_NSG_1684218493261Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684218493261Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682915211879" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910673137_id
    # Optional
    display_name   = "NSG_ME2_N_GEN_HypInt"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-ccc391a2-5bba-430c-ba70-a199f7b6f7e2"}
}

locals {
    Okit_NSG_1682915211879_id = oci_core_network_security_group.Okit_NSG_1682915211879.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683182524744Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915211879_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "All Hyperion VMs HTTPS"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "10.92.2.248/29"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1683182524744Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683182524744Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683197241670Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915211879_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "All Hyperion VMs HTTPS"
        destination = "10.92.2.248/29"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1683197241670Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683197241670Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684218596182Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915211879_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "All Hyperion VMs HTTPS"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "10.92.2.244/30"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1684218596182Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684218596182Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684226723953Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915211879_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "All Hyperion VMs HTTPS"
        destination = "10.92.2.244/30"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1684226723953Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684226723953Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684226766355Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915211879_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "ZFS backup pool"
        destination = "10.20.0.1/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1684226766355Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684226766355Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682915215987" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910673137_id
    # Optional
    display_name   = "NSG_ME2_N_GEN_HypNAS"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-a30cb80e-9d2b-4778-bb62-a18600ae1f41"}
}

locals {
    Okit_NSG_1682915215987_id = oci_core_network_security_group.Okit_NSG_1682915215987.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683197212727Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915215987_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "SMB to NAS share"
        destination = "10.92.2.142/32"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "445"
            max = "445"
            }
        }
}

locals {
    Okit_NSG_1683197212727Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683197212727Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682915219330" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910673137_id
    # Optional
    display_name   = "NSG_ME2_N_GEN_DB"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-a30cb80e-9d2b-4778-bb62-a18600ae1f41"}
}

locals {
    Okit_NSG_1682915219330_id = oci_core_network_security_group.Okit_NSG_1682915219330.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683197282092Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915219330_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Hyperion DB / Arch DB TNS/TLS"
        destination = "10.1.0.0/29"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "1521"
            max = "1521"
            }
        }
}

locals {
    Okit_NSG_1683197282092Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683197282092Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684226972911Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682915219330_id
    direction    = "EGRESS"
    protocol    = "6"
    # Optional
    description   = "Hyperion DB / Arch DB TNS/TLS"
        destination = "10.1.0.0/29"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "2484"
            max = "2484"
            }
        }
}

locals {
    Okit_NSG_1684226972911Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684226972911Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682917538694" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910676159_id
    # Optional
    display_name   = "NSG_ME2_N_SS_SA"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-60a5ab65-47f9-44ae-83c1-887d35c16f3b"}
}

locals {
    Okit_NSG_1682917538694_id = oci_core_network_security_group.Okit_NSG_1682917538694.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683182904149Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917538694_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "PCA Service  Automation for cyberaRK"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "192.168.1.42/32"
        tcp_options {
            destination_port_range {
            min = "22"
            max = "22"
            }
        }
}

locals {
    Okit_NSG_1683182904149Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683182904149Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683182946202Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917538694_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "PCA Service  Automation for https"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "192.168.1.44/32"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1683182946202Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683182946202Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683183031498Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917538694_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "PCA Service  Automation for ansible"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "192.168.0.41/32"
        tcp_options {
            destination_port_range {
            min = "22"
            max = "22"
            }
        }
}

locals {
    Okit_NSG_1683183031498Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683183031498Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683196780067Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917538694_id
    direction    = "EGRESS"
    protocol    = "all"
    # Optional
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
}

locals {
    Okit_NSG_1683196780067Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683196780067Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682917541150" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910676159_id
    # Optional
    display_name   = "NSG_ASY_N_SS_ASG"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-8a3767f1-8dbd-4443-afb6-174ebdd5dcc9"}
}

locals {
    Okit_NSG_1682917541150_id = oci_core_network_security_group.Okit_NSG_1682917541150.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683183079791Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917541150_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "ASG (for Oracle  remote access) for cyberark"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "192.168.1.48/32"
        tcp_options {
            destination_port_range {
            min = "22"
            max = "22"
            }
        }
}

locals {
    Okit_NSG_1683183079791Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683183079791Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683183106340Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917541150_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "ASG (for Oracle  remote access) for oracle"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "192.168.0.47/32"
        tcp_options {
            destination_port_range {
            min = "22"
            max = "22"
            }
        }
}

locals {
    Okit_NSG_1683183106340Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683183106340Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683196815038Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917541150_id
    direction    = "EGRESS"
    protocol    = "all"
    # Optional
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
}

locals {
    Okit_NSG_1683196815038Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683196815038Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683196843236Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917541150_id
    direction    = "EGRESS"
    protocol    = "all"
    # Optional
    description   = "out traffic"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
}

locals {
    Okit_NSG_1683196843236Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683196843236Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1682917543450" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910676159_id
    # Optional
    display_name   = "NSG_ME2_N_SS_OEM"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-35c3c154-795c-4347-b94f-f262cfabb81f"}
}

locals {
    Okit_NSG_1682917543450_id = oci_core_network_security_group.Okit_NSG_1682917543450.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683183182028Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917543450_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "PCA OEM for ssh "
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "192.168.170.49/32"
        tcp_options {
            destination_port_range {
            min = "22"
            max = "22"
            }
        }
}

locals {
    Okit_NSG_1683183182028Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683183182028Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683183195158Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917543450_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "PCA OEM for https"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "192.168.170.44/32"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1683183195158Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683183195158Rule.id
}
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1683196873187Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1682917543450_id
    direction    = "EGRESS"
    protocol    = "all"
    # Optional
    description   = "out traffic"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "0.0.0.0/0"
        source_type  = "CIDR_BLOCK"
}

locals {
    Okit_NSG_1683196873187Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1683196873187Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1684227031576" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910673137_id
    # Optional
    display_name   = "NSG_ME2_N_GEN_GblWeb"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-d46b8d1a-805a-4ed5-a83a-5ee6957274c2"}
}

locals {
    Okit_NSG_1684227031576_id = oci_core_network_security_group.Okit_NSG_1684227031576.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684227045437Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1684227031576_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "Global Web Server access"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        tcp_options {
            destination_port_range {
            min = "443"
            max = "443"
            }
        }
}

locals {
    Okit_NSG_1684227045437Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684227045437Rule.id
}


# ------ Create Network Security Group
resource "oci_core_network_security_group" "Okit_NSG_1684227076584" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    vcn_id         = local.Okit_VCN_1682910673137_id
    # Optional
    display_name   = "NSG_ME2_N_GEN_BS"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-2a9778ab-2e87-4a94-a104-1c44072ca3f1"}
}

locals {
    Okit_NSG_1684227076584_id = oci_core_network_security_group.Okit_NSG_1684227076584.id
}

# ------ Create Network Security Group Rules
resource "oci_core_network_security_group_security_rule" "Okit_NSG_1684227100788Rule" {
    # Required
    network_security_group_id = local.Okit_NSG_1684227076584_id
    direction    = "INGRESS"
    protocol    = "6"
    # Optional
    description   = "BIH on SMB"
        destination = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        source = "10.2.0.9/32"
        tcp_options {
            destination_port_range {
            min = "445"
            max = "445"
            }
        }
}

locals {
    Okit_NSG_1684227100788Rule_id = oci_core_network_security_group_security_rule.Okit_NSG_1684227100788Rule.id
}


# ------ Create Route Table
# ------- Update VCN Default Route Table
resource "oci_core_default_route_table" "Okit_RT_1682910673150" {
    # Required
    manage_default_resource_id = local.Okit_VCN_1682910673137_default_route_table_id
    # Optional
    display_name   = "RUT_ME2_N_GEN"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-2e36cfad-bf15-4938-9a3f-cea08bf7c1a8"}
}

locals {
    Okit_RT_1682910673150_id = oci_core_default_route_table.Okit_RT_1682910673150.id
    }


# ------ Create Route Table
# ------- Update VCN Default Route Table
resource "oci_core_default_route_table" "Okit_RT_1682910676166" {
    # Required
    manage_default_resource_id = local.Okit_VCN_1682910676159_default_route_table_id
    # Optional
    display_name   = "RUT_ME2_N_TL"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-9003f468-2800-4d2c-84ab-d6e1ebb0fcc8"}
}

locals {
    Okit_RT_1682910676166_id = oci_core_default_route_table.Okit_RT_1682910676166.id
    }


# ------ Create Security List
# ------- Update VCN Default Security List
resource "oci_core_default_security_list" "Okit_SL_1682910673185" {
    # Required
    manage_default_resource_id = local.Okit_VCN_1682910673137_default_security_list_id
    egress_security_rules {
        # Required
        protocol    = "all"
        destination = "0.0.0.0/0"
        # Optional
        destination_type  = "CIDR_BLOCK"
    }
    ingress_security_rules {
        # Required
        protocol    = "6"
        source      = "0.0.0.0/0"
        # Optional
        source_type  = "CIDR_BLOCK"
        tcp_options {
            min = "22"
            max = "22"
        }
    }
    ingress_security_rules {
        # Required
        protocol    = "1"
        source      = "0.0.0.0/0"
        # Optional
        source_type  = "CIDR_BLOCK"
        icmp_options {
            type = "3"
            code = "4"
        }
    }
    ingress_security_rules {
        # Required
        protocol    = "1"
        source      = "10.0.0.0/16"
        # Optional
        source_type  = "CIDR_BLOCK"
        icmp_options {
            type = "3"
        }
    }
    # Optional
    display_name   = "Default Security List for VCN_ME2_N_GEN"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-4e63a66d-4e90-4225-97a8-ce4cb9a0165f"}
}

locals {
    Okit_SL_1682910673185_id = oci_core_default_security_list.Okit_SL_1682910673185.id
}


# ------ Create Security List
# ------- Update VCN Default Security List
resource "oci_core_default_security_list" "Okit_SL_1682910676172" {
    # Required
    manage_default_resource_id = local.Okit_VCN_1682910676159_default_security_list_id
    egress_security_rules {
        # Required
        protocol    = "all"
        destination = "0.0.0.0/0"
        # Optional
        destination_type  = "CIDR_BLOCK"
    }
    ingress_security_rules {
        # Required
        protocol    = "6"
        source      = "0.0.0.0/0"
        # Optional
        source_type  = "CIDR_BLOCK"
        tcp_options {
            min = "22"
            max = "22"
        }
    }
    ingress_security_rules {
        # Required
        protocol    = "1"
        source      = "0.0.0.0/0"
        # Optional
        source_type  = "CIDR_BLOCK"
        icmp_options {
            type = "3"
            code = "4"
        }
    }
    ingress_security_rules {
        # Required
        protocol    = "1"
        source      = "10.1.0.0/16"
        # Optional
        source_type  = "CIDR_BLOCK"
        icmp_options {
            type = "3"
        }
    }
    # Optional
    display_name   = "Default Security List for VCN_ME2_N_SS"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-924de054-2f13-4856-ba85-6640954f9d4f"}
}

locals {
    Okit_SL_1682910676172_id = oci_core_default_security_list.Okit_SL_1682910676172.id
}


# ------ Create Subnet
# ---- Create Public Subnet
resource "oci_core_subnet" "Okit_S_1682910700629" {
    # Required
    compartment_id             = local.Okit_C_1682910617265_id
    vcn_id                     = local.Okit_VCN_1682910673137_id
    cidr_block                 = "10.92.2.128/25"
    # Optional
    display_name               = "SUB_ME2_N_GEN"
    dns_label                  = "submengen"
    security_list_ids          = [local.Okit_SL_1682910673185_id]
    route_table_id             = local.Okit_RT_1682910673150_id
    dhcp_options_id            = local.Okit_DO_1682910673194_id
    prohibit_public_ip_on_vnic = true
    freeform_tags              = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-726956b7-28fb-4f30-a1d9-a3ee63e4f11e"}
}

locals {
    Okit_S_1682910700629_id              = oci_core_subnet.Okit_S_1682910700629.id
    Okit_S_1682910700629_domain_name     = oci_core_subnet.Okit_S_1682910700629.subnet_domain_name
    Okit_S_1682910700629_netmask         = substr(oci_core_subnet.Okit_S_1682910700629.cidr_block, -2, -1)
    Okit_S_1682910700629_cidr_block      = "10.92.2.128/25"
}


# ------ Create Subnet
# ---- Create Public Subnet
resource "oci_core_subnet" "Okit_S_1682910711555" {
    # Required
    compartment_id             = local.Okit_C_1682910617265_id
    vcn_id                     = local.Okit_VCN_1682910676159_id
    cidr_block                 = "10.93.2.16/28"
    # Optional
    display_name               = "SUB_ME2_N_TL"
    dns_label                  = "submentl"
    security_list_ids          = [local.Okit_SL_1682910676172_id]
    route_table_id             = local.Okit_RT_1682910676166_id
    dhcp_options_id            = local.Okit_DO_1682910676178_id
    prohibit_public_ip_on_vnic = true
    freeform_tags              = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-93019041-b0b8-4de8-842f-2976a29c3371"}
}

locals {
    Okit_S_1682910711555_id              = oci_core_subnet.Okit_S_1682910711555.id
    Okit_S_1682910711555_domain_name     = oci_core_subnet.Okit_S_1682910711555.subnet_domain_name
    Okit_S_1682910711555_netmask         = substr(oci_core_subnet.Okit_S_1682910711555.cidr_block, -2, -1)
    Okit_S_1682910711555_cidr_block      = "10.93.2.16/28"
}


# ------ Create Virtual Cloud Network
resource "oci_core_vcn" "Okit_VCN_1682910673137" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    cidr_block     = "10.92.2.0/24" 
    # Optional
    dns_label      = "vcnmengen"
    display_name   = "VCN_ME2_N_GEN"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-c81833ce-4cb8-4279-b23e-05c8331f8155"}
}

locals {
    Okit_VCN_1682910673137_id                       = oci_core_vcn.Okit_VCN_1682910673137.id
    Okit_VCN_1682910673137_dhcp_options_id          = oci_core_vcn.Okit_VCN_1682910673137.default_dhcp_options_id
    Okit_VCN_1682910673137_domain_name              = oci_core_vcn.Okit_VCN_1682910673137.vcn_domain_name
    Okit_VCN_1682910673137_default_dhcp_options_id  = oci_core_vcn.Okit_VCN_1682910673137.default_dhcp_options_id
    Okit_VCN_1682910673137_default_security_list_id = oci_core_vcn.Okit_VCN_1682910673137.default_security_list_id
    Okit_VCN_1682910673137_default_route_table_id   = oci_core_vcn.Okit_VCN_1682910673137.default_route_table_id
}


# ------ Create Virtual Cloud Network
resource "oci_core_vcn" "Okit_VCN_1682910676159" {
    # Required
    compartment_id = local.Okit_C_1682910617265_id
    cidr_block     = "10.93.2.0/27" 
    # Optional
    dns_label      = "vcnmentl"
    display_name   = "VCN_ME2_N_TL"
    freeform_tags  = {"okit_version": "0.49.0", "okit_model_id": "okit-model-9975f454-108e-4726-beae-629299232ea4", "okit_reference": "okit-88169f81-c7b6-4778-a55d-02abe08d97d0"}
}

locals {
    Okit_VCN_1682910676159_id                       = oci_core_vcn.Okit_VCN_1682910676159.id
    Okit_VCN_1682910676159_dhcp_options_id          = oci_core_vcn.Okit_VCN_1682910676159.default_dhcp_options_id
    Okit_VCN_1682910676159_domain_name              = oci_core_vcn.Okit_VCN_1682910676159.vcn_domain_name
    Okit_VCN_1682910676159_default_dhcp_options_id  = oci_core_vcn.Okit_VCN_1682910676159.default_dhcp_options_id
    Okit_VCN_1682910676159_default_security_list_id = oci_core_vcn.Okit_VCN_1682910676159.default_security_list_id
    Okit_VCN_1682910676159_default_route_table_id   = oci_core_vcn.Okit_VCN_1682910676159.default_route_table_id
}

