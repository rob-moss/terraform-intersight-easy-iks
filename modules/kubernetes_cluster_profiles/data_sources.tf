#__________________________________________________________
#
# Get outputs from the Organization Policies Workspace
#__________________________________________________________

data "terraform_remote_state" "local_policies" {
  for_each = { for k, v in local.tfc_workspaces : k => v if v.backend == "local" }
  backend  = each.value.backend
  config = {
    path = "${each.value.policies_dir}terraform.tfstate"
  }
}

data "terraform_remote_state" "remote_policies" {
  for_each = { for k, v in local.tfc_workspaces : k => v if v.backend == "remote" }
  backend  = each.value.backend
  config = {
    organization = each.value.organization
    workspaces = {
      name = each.value.workspace.name
    }
  }
}


#data "terraform_remote_state" "remote_policies" {
#  backend = "remote"
#  config = {
#    organization = var.organization
#    workspaces = {
#      name = var.workspaces
#    }
#  }
#}


#data "terraform_remote_state" "remote_policies" {
#  backend  = "remote"
#  config = {
#    organization = var.organization
#    workspaces = {
#      name = var.tfc_organization
#    }
#  }
#}
#