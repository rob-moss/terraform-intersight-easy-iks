#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: User Drop Down > Account {Name} > Account ID
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}
