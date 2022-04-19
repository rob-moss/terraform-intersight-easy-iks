#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

#__________________________________________________________
#
# Intersight Variables
#__________________________________________________________

# endpoint     = "https://intersight.com"
organizations = ["default"]
# secretkey    = "../../../../intersight.secret"

#__________________________________________________________
#
# Intersight Global Tags Variable
# Default Tags if no resource tags are defined
#__________________________________________________________

tags = [{ key = "Module", value = "terraform-intersight-easy-iks" }, { key = "Owner", value = "romoss" }, { key = "Environment", value = "iksworkshop" }]


#______________________________________________
#
# Add-ons Policies Variables
#______________________________________________

addons_policies = {
  "ccp-monitor" = {
    # This is empty because I am accepting all the default values
  }
  "kubernetes-dashboard" = {
    install_strategy = "InstallOnly"
    upgrade_strategy = "AlwaysReinstall"
  }
  "smm-demoapp" = {
    chart_name       = "smm"
    chart_version    = "1.8.2-cisco2-helm3"
    install_strategy = "Always"
    overrides        = "demoApplication,enabled,true"
    release_name     = "smm1.8"
    upgrade_strategy = "ReinstallOnFailure"
  }

  "smm-nodemo" = {
    chart_name       = "smm"
    chart_version    = "1.8.2-cisco2-helm3"
    install_strategy = "Always"
    overrides        = "demoApplication,enabled,false"
    release_name     = "smm1.8"
    upgrade_strategy = "ReinstallOnFailure"
  }

}

#__________________________________________________
#
# Container Runtime Policy Variables
#__________________________________________________

container_runtime_policies = {}

#______________________________________________
#
# IP Pool Variables
#______________________________________________

ip_pools = {
  "iksworkshop_pool_1" = {
    assignment_order = "sequential"
    ipv4_blocks = {
      config = {
        from = "172.17.49.200"
        to   = "172.17.49.249"
      }
    }
    ipv4_config = [
      {
        gateway       = "172.17.49.1"
        netmask       = "255.255.255.0"
        primary_dns   = "172.16.1.98"
      }
    ]
    ipv6_blocks  = {}
    ipv6_config  = []
    organization = "default"
    tags         = [{ key = "range", value = "172.17.49.200-249" }]
    description = "IP Subnet 172.17.49.0/24 for Workshop and General"
  }


  "iks-ippool-172.19.5.x" = {
    assignment_order = "sequential"
    ipv4_blocks = {
      config = {
        from = "172.19.5.1"
        to   = "172.19.5.254"
      }
    }
    ipv4_config = [
      {
        gateway       = "172.19.4.1"
        netmask       = "255.255.252.0"
        primary_dns   = "172.16.1.98"
      }
    ]
    ipv6_blocks  = {}
    ipv6_config  = []
    organization = "default"
    tags         = [{ key = "owner", value = "romoss" },{ key = "vlan", value = "2037" },{ key = "subnet", value = "172.19.5.x" }]
    description = "VLAN 2037 / Subnet 172.19.5.x/22 for Workshop and General"
  }

}


 #"iks-workshop-pool-172.17.49.x" = {
  #  assignment_order = "sequential"
  #  ipv4_block = [
  #    {
  #      from = "172.17.49.100"
  #      to   = "172.17.49.159"
  #    },
  #  ]
  #  ipv4_config = {
  #    config = {
  #      gateway       = "172.17.49.1"
  #      netmask       = "255.255.255.0"
  #      primary_dns   = "172.16.1.98"
  #    }
  #  }
  #  ipv6_block   = []
  #  ipv6_config  = {}
  #  organization = "default"
  #  tags         = [{ key = "range", value = "172.17.49.100-159" }]
  #}

  #"iks-workshop-172.19.5.x" = {
  #  assignment_order = "sequential"
  #  ipv4_block = [
  #    {
  #      from = "172.19.5.1"
  #      to   = "172.19.5.254"
  #    },
  #  ]
  #  ipv4_config = {
  #    config = {
  #      gateway       = "172.19.4.1"
  #      netmask       = "255.255.252.0"
  #      primary_dns   = "172.16.1.98"
  #    }
  #  }
  #  ipv6_block   = []
  #  ipv6_config  = {}
  #  organization = "default"
  #  tags         = [{ key = "range", value = "172.19.5.1-254" }]
  #  # description? "VLAN 2037 / Subnet 172.19.5.x/22"
  #}
#}

#__________________________________________________
#
# Kubernetes Version Policy Variables
#__________________________________________________

kubernetes_version_policies = {
  "iksworkshop_v1_19_5" = {
    version      = "v1.19.5"
  }
  "iksworkshop_v1_19_15" = {
    version      = "v1.19.15"
  }
  "iksworkshop_v1_20_14" = {
    version      = "v1.20.14"
  }
  "iksworkshop_v1_21_10" = {
    version      = "v1.21.10"
  }

}

#______________________________________________
#
# Network CIDR Policy Variables
#______________________________________________

network_cidr_policies = {
  "iksworkshop_network_cidr" = {
    description      = "Defaults for Kubernetes: Pod 192.168.0.0/16 and Svc 10.96.0.0/12"
    pod_network_cidr = "192.168.0.0/16"
    service_cidr     = "10.96.0.0/12"
  }
  "iksworkshop_100.64_cidr" = {
    description      = "Pod 100.64 and Svc 100.65 networks from Service Provider NAT range"
    pod_network_cidr = "100.64.0.0/16"
    service_cidr     = "100.65.0.0/16"
  }
}


#______________________________________________
#
# Node OS Configuration Policy Variables
#______________________________________________

nodeos_configuration_policies = {
  "iksworkshop_nodeos_config" = {
    dns_servers = ["172.16.1.98"]
    dns_suffix  = "auslab.cisco.com"
    #  If ntp_servers is not set, dns_servers will be used as NTP servers
    ntp_servers = ["172.16.1.90", "172.16.1.91"]
    # organization = "default"
    # For a List of timezones see
    # https://github.com/terraform-cisco-modules/terraform-intersight-imm/blob/master/modules/policies_ntp/README.md.
    timezone = "Australia/Sydney"
  }
}

#__________________________________________________
#
# Trusted Certificate Authorities Policy Variables
#__________________________________________________

trusted_certificate_authorities = {}

#trusted_certificate_authorities = {
#  "iksworkshop_registry" = {
#    organization        = "default"
#    unsigned_registries = ["10.101.128.128"]
#  }
#}


#_______________________________________________
#
# Virtual Machine Infra Config Policy Variables
#_______________________________________________

virtual_machine_infra_config = {
  iks-general-172_17_50_x = {
    description   = "HX General / IP Subnet 172.17.50.x"
    tags          = [{ key = "Cluster", value = "HX-General" }, { key = "Subnet", value = "172.17.50.x" }]
    target        = "field-hxp4vc.auslab.cisco.com"
    # target_password from env vars
    virtual_infrastructure = [{
      cluster       = "HX-R4-Cloud-Native-General"
      datastore     = "CCP-Datastore"
      interfaces     = ["field-hxp5|user-workloads|Ext-172.17.50.x_24"]
      resource_pool = ""
      type          = "vmware"
    }]
  }

  iks-general-172_19_5_x = {
    description   = "HX General / IP Subnet 172.19.5.x"
    tags          = [{ key = "Cluster", value = "HX-General" }, { key = "Subnet", value = "172.19.5.x" }]
    target        = "field-hxp4vc.auslab.cisco.com"
    virtual_infrastructure = [{
      cluster       = "HX-R4-Cloud-Native-General"
      datastore     = "CCP-Datastore"
      interfaces     = ["field-hxp5|user-workloads|Ext-172.19.4.x_22"]
      resource_pool = ""
      type          = "vmware"
    }]
  }


#   IWE Cluster
  iks-iwe-workshop-172_19_5_x = {
    description   = "IWE Workshop / IP Subnet 172.19.5.x"
    tags          = [{ key = "Cluster", value = "IWE-Workshop" }, { key = "Subnet", value = "172.19.5.x" }]
    target        = "IWE-Workshop"
    virtual_infrastructure = [{
      interfaces     = ["iwe-tenant-net-v2037"]
      provider_name = "iwe-tenant-net-v2037"
      type          = "iwe"
    }]
  }

  iks-iwe-workshop-172_17_49_x = {
    description   = "IWE Workshop / IP Subnet 172.17.49.x"
    tags          = [{ key = "Cluster", value = "IWE-Workshop" }, { key = "Subnet", value = "172.17.49x" }]
    target        = "IWE-Workshop"
    virtual_infrastructure = [{
      interfaces     = ["iwe-tenant-net-v2018"]
      provider_name = "iwe-tenant-net-v2018"
      type          = "iwe"
    }]
  }

}


#_______________________________________________
#
# Virtual Machine Infra Config Policy for IWE
#_______________________________________________

# need to do this

#________________________________________________
#
# Virtual Machine Instance Type Policy Variables
#________________________________________________

virtual_machine_instance_type = {
  # Control Plane
  iksworkshop_ctl-small = {
    organization = "default"
    cpu          = 2
    disk         = 60
    memory       = 16384
  }
  # Workers
  iksworkshop_wrk-small = {
    organization = "default"
    cpu          = 4
    disk         = 60
    memory       = 32768
  }
  iksworkshop_wrk-medium = {
    cpu          = 8
    disk         = 60
    memory       = 65536
    organization = "default"
  }
  iksworkshop_wrk-large = {
    cpu          = 16
    disk         = 60
    memory       = 131072
    organization = "default"
  }
}
