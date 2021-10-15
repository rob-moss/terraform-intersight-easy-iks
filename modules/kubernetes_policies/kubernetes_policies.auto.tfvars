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
/*
  To export the Secret Key via an Environment Variable the format is as follows (Note: they are not quotation marks, but escape characters):
  - export TF_VAR_secretkey=`cat ../../intersight.secret`
  Either way will work in this case as we are not posting the contents of the file here.
*/
/*
  We highly recommend that for the apikey you use an environment variable for input:
  - export TF_VAR_apikey="abcdefghijklmnopqrstuvwxyz.0123456789"
*/
# apikey = "value"

#__________________________________________________________
#
# Intersight Global Tags Variable
# Default Tags if no resource tags are defined
#__________________________________________________________

tags = [{ key = "Module", value = "terraform-intersight-iks-iwo" }, { key = "Owner", value = "romoss" }, { key = "Environment", value = "iksworkshop" }]


#______________________________________________
#
# Add-ons Policies Variables
#______________________________________________

addons_policies = {
  "ccp-monitor" = {
    organization = "default"
    # This is empty because I am accepting all the default values
  }
  "kubernetes-dashboard" = {
    install_strategy = "InstallOnly"
    organization     = "default"
    upgrade_strategy = "AlwaysReinstall"
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
    ipv4_block = [
      {
        from = "172.17.49.200"
        to   = "172.17.49.250"
      },
    ]
    ipv4_config = {
      config = {
        gateway       = "172.17.49.1"
        netmask       = "255.255.255.0"
        primary_dns   = "172.16.1.98"
        #secondary_dns = "10.101.128.16"
      }
    }
    ipv6_block   = []
    ipv6_config  = {}
    organization = "default"
    tags         = []
  }
}

#__________________________________________________
#
# Kubernetes Version Policy Variables
#__________________________________________________

kubernetes_version_policies = {
  "iksworkshop_v1_19_5" = {
    version      = "v1.19.5"
    organization = "default"
  }
}

#______________________________________________
#
# Network CIDR Policy Variables
#______________________________________________

network_cidr_policies = {
  "iksworkshop_network_cidr" = {
    organization = "default"
    cidr_pod     = "192.168.0.0/16"
    cidr_service = "10.96.0.0/12"
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
    organization = "default"
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
  iksworkshop_vm_infra = {
    organization          = "default"
    vsphere_cluster       = "HX-R4-Cloud-Native-Workshop"
    vsphere_datastore     = "CCP"
    vsphere_portgroup     = ["field-hxp4|user-workloads|Ext-172.17.49.x_24"]
    vsphere_resource_pool = ""
    vsphere_target        = "field-hxp4vc.auslab.cisco.com"
  }
}


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
