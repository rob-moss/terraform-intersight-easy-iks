#_______________________________________________
#
# Virtual Machine Infra Config Policy Variables
#_______________________________________________

variable "virtual_machine_infra_config" {
  default = {
    default = {
      description = ""
      tags        = []
      target      = ""
      virtual_infrastructure = [
        {
          cluster       = "default"
          datastore     = "datastore1"
          disk_mode     = "Block"
          interfaces    = ["VM Network"]
# no defualts here. leave undefined. causes issues with IWE
#          ip_pool       = ""
          mtu           = 0
          name          = ""
          provider_name = ""
          resource_pool = ""
          type          = "vmware"
          vrf           = ""
        }
      ]
    }
  }
  description = <<-EOT
  Intersight Kubernetes Virtual Machine Infra Config Policy Variable Map.
  Key - Name of the Virtual Machine Infra Config Policy
  * description - A description for the policy.
  * tags - List of key/value Attributes to Assign to the Policy.
  * target - Name of the IWE or vSphere Target discovered in Intersight, to provision the cluster to.
  * virtual_infrastructure - List of Virtual Infrastructure Configuration Parameters
    - cluster: (VMware) - vSphere Cluster to assign the K8S Cluster Deployment.
    - datastore: (VMware) - vSphere Datastore to assign the K8S Cluster Deployment.
    - interfaces: (Both) - vSphere Port Group to assign the K8S Cluster Deployment.
    - mtu: (IWE) - MTU to assign to the Interface
    - provider_name: (IWE) - In other words, to which named network from the Instructure Provider will the port be connected.
    - resource_pool: (VMware) - vSphere Resource Pool to assign the K8S Cluster Deployment.
  EOT
  type = map(object(
    {
      description = optional(string)
      tags        = optional(list(map(string)))
      target      = string
      virtual_infrastructure = list(object(
        {
          cluster       = optional(string)
          datastore     = optional(string)
          disk_mode     = optional(string)
          interfaces    = list(string)
          ip_pool       = optional(string)
          mtu           = optional(number)
          name          = optional(string)
          provider_name = optional(string)
          resource_pool = optional(string)
          type          = string
          vrf           = optional(string)
        }
      ))
    }
  ))
}

variable "target_password" {
  description = "Target Password.  Note: this is the password of the Credentials used to register the Virtualization Target."
  sensitive   = true
  type        = string
}


#_______________________________________________________________________
#
# Intersight Kubernetes Virtual Machine Infra Config Policy
# GUI Location: Policies > Create Policy > Virtual Machine Infra Config
#_______________________________________________________________________

data "intersight_asset_target" "target" {
  for_each = local.virtual_machine_infra_config
  name     = each.value.target
}

resource "intersight_kubernetes_virtual_machine_infra_config_policy" "virtual_machine_infra_config" {
  depends_on = [
    data.intersight_asset_target.target,
    intersight_ippool_pool.ip_pools
  ]
  for_each    = local.virtual_machine_infra_config
  description = each.value.description != "" ? each.value.description : "${each.key} Virtual Machine Infra Config Policy."
  name        = each.key
  organization {
    moid        = local.org_moid
    object_type = "organization.Organization"
  }
  target {
    object_type = "asset.DeviceRegistration"
    moid        = data.intersight_asset_target.target[each.key].results.0.registered_device[0].moid
  }
  dynamic "vm_config" {
    for_each = { for k, v in each.value.virtual_infrastructure : k => v if v.type == "vmware" }
    content {
      additional_properties = jsonencode({
        Datastore    = vm_config.value.datastore
        Cluster      = vm_config.value.cluster
        ResourcePool = vm_config.value.resource_pool
      })
      interfaces  = vm_config.value.interfaces
      object_type = "kubernetes.EsxiVirtualMachineInfraConfig"

    }
  }
  dynamic "vm_config" {
    for_each = { for k, v in each.value.virtual_infrastructure : k => v if v.type == "iwe" }
    content {
      additional_properties = jsonencode({
        DiskMode   = vm_config.value.disk_mode
        Passphrase = var.target_password
      })
      interfaces = vm_config.value.interfaces
      network_interfaces {
        mtu  = vm_config.value.mtu
        name = vm_config.value.name
# Remove this for the vminfracfg policy on IWE
#        pools {
#          moid = vm_config.value.ip_pool != "" ? intersight_ippool_pool.ip_pools[vm_config.value.ip_pool].id : null
#        }
        provider_name = vm_config.value.provider_name
        vrf {
          moid        = vm_config.value.vrf != "" ? vm_config.value.vrf : ""
          object_type = "vrf.Vrf"
        }
      }
      object_type = "kubernetes.HyperFlexApVirtualMachineInfraConfig"

    }
  }
  dynamic "tags" {
    for_each = length(each.value.tags) > 0 ? each.value.tags : local.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
