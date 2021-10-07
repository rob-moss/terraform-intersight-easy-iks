locals {
  # Intersight Organization Variables
  organizations = toset(jsondecode(var.organizations))
  org_moids = {
    for v in sort(keys(data.intersight_organization_organization.org_moid)) : v => {
      moid = data.intersight_organization_organization.org_moid[v].results[0].moid
    }
  }
  tags = jsondecode(var.tags)
  # IKS Cluster Variables
  addons_policies = {
    for k, v in jsondecode(var.addons_policies) : k => {
      description       = (v.description != null ? v.description : "")
      install_strategy  = (v.install_strategy != null ? v.install_strategy : "Always")
      organization      = (v.organization != null ? v.organization : "default")
      release_name      = (v.release_name != null ? v.release_name : "")
      release_namespace = (v.release_namespace != null ? v.release_namespace : "")
      tags              = (v.tags != null ? v.tags : [])
      upgrade_strategy  = (v.upgrade_strategy != null ? v.upgrade_strategy : "UpgradeOnly")
    }
  }
  container_runtime_policies = {
    for k, v in jsondecode(var.container_runtime_policies) : k => {
      description        = (v.description != null ? v.description : "")
      docker_bridge_cidr = (v.docker_bridge_cidr != null ? v.docker_bridge_cidr : "")
      docker_no_proxy    = (v.docker_no_proxy != null ? v.docker_no_proxy : [])
      http_hostname      = (v.http_hostname != null ? v.http_hostname : "")
      http_port          = (v.http_port != null ? v.http_port : 8080)
      http_protocol      = (v.http_protocol != null ? v.http_protocol : "http")
      http_username      = (v.http_username != null ? v.http_username : "")
      https_hostname     = (v.https_hostname != null ? v.https_hostname : "")
      https_port         = (v.https_port != null ? v.https_port : 8443)
      https_protocol     = (v.https_protocol != null ? v.https_protocol : "https")
      https_username     = (v.https_username != null ? v.https_username : "")
      organization       = (v.organization != null ? v.organization : "default")
      tags               = (v.tags != null ? v.tags : [])
    }
  }
  ip_pools = {
    for k, v in jsondecode(var.ip_pools) : k => {
      assignment_order = (v.assignment_order != null ? v.assignment_order : "default")
      description      = (v.description != null ? v.description : "")
      ipv4_block       = (v.ipv4_block != null ? v.ipv4_block : [])
      ipv4_config      = (v.ipv4_config != null ? v.ipv4_config : {})
      ipv6_block       = (v.ipv6_block != null ? v.ipv6_block : [])
      ipv6_config      = (v.ipv6_config != null ? v.ipv6_config : {})
      organization     = (v.organization != null ? v.organization : "default")
      tags             = (v.tags != null ? v.tags : [])
    }
  }
  network_cidr_policies = {
    for k, v in jsondecode(var.network_cidr_policies) : k => {
      cidr_pod     = (v.cidr_pod != null ? v.cidr_pod : "100.64.0.0/16")
      cidr_service = (v.cidr_service != null ? v.cidr_service : "100.65.0.0/16")
      cni_type     = (v.cni_type != null ? v.cni_type : "Calico")
      description  = (v.description != null ? v.description : "")
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }
  nodeos_configuration_policies = {
    for k, v in jsondecode(var.nodeos_configuration_policies) : k => {
      description    = (v.description != null ? v.description : "")
      dns_servers_v4 = (v.dns_servers_v4 != null ? v.dns_servers_v4 : ["208.67.220.220", "208.67.222.222"])
      domain_name    = (v.domain_name != null ? v.domain_name : "example.com")
      ntp_servers    = (v.ntp_servers != null ? v.ntp_servers : [])
      organization   = (v.organization != null ? v.organization : "default")
      tags           = (v.tags != null ? v.tags : [])
      timezone       = (v.timezone != null ? v.timezone : "Etc/GMT")
    }
  }
  trusted_certificate_authorities = {
    for k, v in jsondecode(var.trusted_certificate_authorities) : k => {
      description  = (v.description != null ? v.description : "")
      organization = (v.organization != null ? v.organization : "default")
      root_ca      = (v.root_ca != null ? v.root_ca : [])
      tags         = (v.tags != null ? v.tags : [])
      unsigned     = (v.unsigned != null ? v.unsigned : [])
    }
  }
  kubernetes_version_policies = {
    for k, v in jsondecode(var.kubernetes_version_policies) : k => {
      description  = (v.description != null ? v.description : "")
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
      version      = (v.version != null ? v.version : "1.19.5")
    }
  }
  virtual_machine_infra_config = {
    for k, v in jsondecode(var.virtual_machine_infra_config) : k => {
      description           = (v.description != null ? v.description : "")
      organization          = (v.organization != null ? v.organization : "default")
      tags                  = (v.tags != null ? v.tags : [])
      vsphere_cluster       = coalesce(v.vsphere_cluster, "default")
      vsphere_datastore     = coalesce(v.vsphere_datastore, "datastore1")
      vsphere_portgroup     = coalesce(v.vsphere_portgroup, ["VM Network"])
      vsphere_resource_pool = (v.vsphere_resource_pool != null ? v.vsphere_resource_pool : "")
      vsphere_target        = coalesce(v.vsphere_target, "")
    }
  }
  virtual_machine_instance_type = {
    for k, v in jsondecode(var.virtual_machine_instance_type) : k => {
      description  = (v.description != null ? v.description : "")
      cpu          = (v.cpu != null ? v.cpu : 4)
      disk         = (v.disk != null ? v.disk : 40)
      memory       = (v.memory != null ? v.memory : 16384)
      organization = (v.organization != null ? v.organization : "default")
      tags         = (v.tags != null ? v.tags : [])
    }
  }
}