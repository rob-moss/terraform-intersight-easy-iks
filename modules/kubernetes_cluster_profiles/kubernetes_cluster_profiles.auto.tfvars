#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

tfc_organization = "Cisco-IST-TigerTeam"
tfc_workspace    = "iksworkshop_iks_cl01"

#__________________________________________________________
#
# Kubernetes Cluster Profile Variables
#__________________________________________________________

kubernetes_cluster_profiles = {
  "iksworkshop_k8s_cl01" = {
    action                             = "Deploy" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policy_moid                 = ["ccp-monitor", "kubernetes-dashboard"]
    container_runtime_moid             = ""
    ip_pool_moid                       = "iksworkshop_pool_v4"
    network_cidr_moid                  = "iksworkshop_network_cidr"
    nodeos_configuration_moid          = "iksworkshop_nodeos_config"
    load_balancer_count                = 3
    organization                       = "default"
    ssh_public_key                     = "ssh_public_key_1"  # This is a variable
    ssh_user                           = "iksadmin"
    tags                               = []
    trusted_certificate_authority_moid = "iksworkshop_registry"
    wait_for_complete                  = false
    node_pools = {
      "control_plane" = {
        action       = "No-op"
        description  = "Control Plane"
        desired_size = 1
        # ip_pool_moid            = "iksworkshop_pool_v4" # can Define if wanting different than the cluster
        kubernetes_labels = [
          {
            key   = "Node Pool"
            value = "Control Plane"
          }
        ]
        kubernetes_version_moid = "iksworkshop_v1_19_5"
        max_size                = 3
        min_size                = 1
        node_type               = "ControlPlane"
        organization            = "default"
        vm_infra_config_moid    = "iksworkshop_vm_infra"
        vm_instance_type_moid   = "iksworkshop_ctl-small"
      }
      "worker01" = {
        action       = "No-op"
        description  = "iksworkshop Kubernetes Cluster01 Worker Pool 1"
        desired_size = 1
        kubernetes_labels = [
          {
            key   = "Node Pool"
            value = "Worker Pool 1"
          }
        ]
        kubernetes_version_moid = "iksworkshop_v1_19_5"
        max_size                = 3
        min_size                = 1
        node_type               = "Worker"
        vm_infra_config_moid    = "iksworkshop_vm_infra"
        vm_instance_type_moid   = "iksworkshop_wrk-medium"
      }
    }
  }
}
