#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

tfc_organization = "Cisco-IST-TigerTeam"
tfc_workspace    = "romoss-iksworkshop_kubernetes_policies"  # name of IKS Policies workspace

#__________________________________________________________
#
# Kubernetes Cluster Profile Variables
#__________________________________________________________


# To edit the Defaults -- open main.tf and edit the variable "kubernetes_cluster_profiles" section

kubernetes_cluster_profiles = {
  "romoss-iks-smmdemo01" = {
    action                    = "Deploy" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = ["smm-demoapp"]
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 3
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    description              = "SMM Demo apps"
    ip_pool                  = "iks-ippool-172.19.5.x"
    network_cidr_policy      = "iksworkshop_network_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "No-Op"
        desired_size              = 2
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }



  "romoss-iks-smmdemo02" = {
    action                    = "Deploy" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = ["smm-demoapp"]
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 3
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    description              = "SMM Demo apps"
    ip_pool                  = "iks-ippool-172.19.5.x"
    network_cidr_policy      = "iksworkshop_network_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "No-Op"
        desired_size              = 2
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }




  "romoss-iks-smmtest01" = {
    action                    = "Deploy" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = ["smm-demoapp"]
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 3
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    description              = ""
    ip_pool                  = "iks-ippool-172.19.5.x"
    network_cidr_policy      = "iksworkshop_network_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "Deploy"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x" # iks-iwe-workshop-172.19.5.x = IWE / iks-general-172_19_5_x = IKS
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "Deploy"
        desired_size              = 2
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }


  "romoss-iks-smmtest02" = {
    action                    = "Deploy" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = ["smm-demoapp"]
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 2
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    description              = ""
    ip_pool                  = "iks-ippool-172.19.5.x"
    network_cidr_policy      = "iksworkshop_network_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "Deploy"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x" # iks-iwe-workshop-172.19.5.x = IWE / iks-general-172_19_5_x = IKS
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "Deploy"
        desired_size              = 2
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }






  ### Blue / Green SMM clusters
  # Blue on ESXi
  # Green on IWE

  # Blue on vSphere: SMM ControlPlane
  "romoss-iksvsp-bluevsp01" = {
    description              = "Blue/Green IKS on vSphere - SMM ControlPlane"
    action                    = "Deploy" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = ["smm-demoapp"]
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 3
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    ip_pool                  = "iks-ippool-172.19.5.x"
    network_cidr_policy      = "iksworkshop_network_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "Deploy"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "Deploy"
        desired_size              = 3
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_11"
        vm_infra_config_policy    = "iks-general-172_19_5_x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }

  # Green on IWE: SMM peer cluster
  "romoss-iksiwe-greeniwe01" = {
    description               = "Blue/Green IKS on IWE - SMM Peer cluster"
    action                    = "No-Op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = []
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 2
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    ip_pool                  = "iks-ippool-172.19.5.x"
    network_cidr_policy      = "iksworkshop_network_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_10"
        vm_infra_config_policy    = "iks-iwe-workshop-172.19.5.x"
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iks-ippool-172.19.5.x"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_10"
        vm_infra_config_policy    = "iks-iwe-workshop-172.19.5.x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }




#  ############################################
#  ### Test clusters



  # Test IWE VL2018 / 172.17.49.x workshop ## works!
  "romoss-iksiwe-testiwe01" = {
    description               = "IWE test iksworkshop_pool_1 iks-iwe-workshop-172.17.49.x"
    action                    = "No-Op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = []
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 2
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    ip_pool                  = "iksworkshop_pool_1"
    network_cidr_policy      = "iksworkshop_network_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iksworkshop_pool_1"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_10"
        vm_infra_config_policy    = "iks-iwe-workshop-172.17.49.x"
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iksworkshop_pool_1"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_10"
        vm_infra_config_policy    = "iks-iwe-workshop-172.17.49.x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }

  # Test IWE 02 - VL2024 / 172.17.50.x general ## Works!
  "romoss-iksiwe-testiwe02" = {
    description               = "IWE test iks-iwe-workshop-172.17.49.x cidr 100.64"
    action                    = "No-Op" # Options are {Delete|Deploy|Ready|No-op|Unassign}.
    addons_policies           = []
    certificate_configuration = false
    cluster_configuration = [
      {
        kubernetes_api_vip  = ""
        load_balancer_count = 2
        ssh_public_key      = 1
        ssh_user            = "iksadmin"
      }
    ]
    container_runtime_policy = ""
    ip_pool                  = "iksworkshop_pool_1"
    network_cidr_policy      = "iksworkshop_100.64_cidr"
    node_pools = {
      "ControlPlanes" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "ControlPlane" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iksworkshop_pool_1"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_10"
        vm_infra_config_policy    = "iks-iwe-workshop-172.17.49.x"
        vm_instance_type_policy   = "iksworkshop_ctl-small"
      },
      "Workers" = {
        action                    = "No-Op"
        desired_size              = 1
        description               = ""
        min_size                  = 1
        max_size                  = 3
        node_type                 = "Worker" # ControlPlaneWorker, ControlPlane, Worker
        ip_pool                   = "iksworkshop_pool_1"
        kubernetes_labels         = []
        kubernetes_version_policy = "iksworkshop_v1_21_10"
        vm_infra_config_policy    = "iks-iwe-workshop-172.17.49.x"
        vm_instance_type_policy   = "iksworkshop_wrk-medium"
      }
    }
    nodeos_configuration_policy   = "iksworkshop_nodeos_config"
    tags                          = []
    trusted_certificate_authority = ""
    wait_for_completion           = false
  }







}
