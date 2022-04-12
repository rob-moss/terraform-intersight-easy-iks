#__________________________________________________________
#
# Terraform Cloud Variables
#__________________________________________________________

agent_pool        = "auslab-tfcb-ist"
terraform_version = "1.0.3"
tfc_email         = "romoss@cisco.com"
tfc_organization  = "Cisco-IST-TigerTeam"
vcs_repo          = "rob-moss/terraform-intersight-easy-iks"

/*
  We highly recommend that for the terraform_cloud_token you use an environment variable for input:
  - export TF_VAR_terraform_cloud_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# terraform_cloud_token = "value"
/*
  We highly recommend that for the tfc_oath_token you use an environment variable for input; Like:
  - export TF_VAR_tfc_oath_token="abcdefghijklmnopqrstuvwxyz.0123456789"
  If you still want to move forward with it in this file, uncomment the line below, and input your value.
*/
# tfc_oauth_token = "value"


#__________________________________________________________
#
# Intersight Variables
#__________________________________________________________

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
# Workspaces to Create
#__________________________________________________________

workspaces = {
  "romoss-iksworkshop_kubernetes_policies" = {
    auto_apply          = true
    description         = "iksworkshop Kubernetes Policies."
    global_remote_state = true
    working_directory   = "modules/kubernetes_policies"
    workspace_type      = "policies"
  }
  "romoss-iksworkshop_iks_cl01" = { ## is this for all clusters?
    auto_apply          = true
    description         = "iksworkshop Intersight Kubernetes Service Cluster01"
    global_remote_state = true
    working_directory   = "modules/kubernetes_cluster_profiles"
    workspace_type      = "cluster"
  }
  "romoss-iksworkshop_iks_cl01_kubeconfig" = {
    auto_apply          = true
    cluster_name        = "romoss-iksworkshop_iks_cl01"
    description         = "iksworkshop Intersight Kubernetes Service Cluster01 kubeconfig."
    global_remote_state = true
    working_directory   = "modules/kubeconfig"
    workspace_type      = "kubeconfig"
  }
#  "iksworkshop_iks_cl01_app_hello" = {
#    agent_pool_id     = "Richfield_Agents"
#    auto_apply        = true
#    description       = "iksworkshop Intersight Kubernetes Service Cluster01 App Hello."
#    execution_mode    = "agent"
#    remote_workspace  = "iksworkshop_iks_cl01_kubeconfig"
#    working_directory = "modules/app_hello"
#    workspace_type    = "app"
#  }
#  "iksworkshop_iks_cl01_iwo" = {
#    agent_pool_id     = "Richfield_Agents"
#    auto_apply        = true
#    description       = "iksworkshop Intersight Kubernetes Service Cluster01 IWO."
#    execution_mode    = "agent"
#    remote_workspace  = "iksworkshop_iks_cl01_kubeconfig"
#    working_directory = "modules/iwo"
#    workspace_type    = "app"
#  }

# IWE Cluster
  "romoss-iksworkshop_iwe_cl02" = {
    auto_apply          = true
    description         = "iksworkshop Intersight Kubernetes Service Cluster01"
    global_remote_state = true
    working_directory   = "modules/kubernetes_cluster_profiles"
    workspace_type      = "cluster"
  }
  "romoss-iksworkshop_iwe_cl02_kubeconfig" = {
    auto_apply          = true
    cluster_name        = "romoss-iksworkshop_iwe_cl02"
    description         = "iksworkshop Intersight Kubernetes Service Cluster01 kubeconfig."
    global_remote_state = true
    working_directory   = "modules/kubeconfig"
    workspace_type      = "kubeconfig"
  }

}
