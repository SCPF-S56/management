locals {
  org_data = jsondecode(file("${path.module}/membership.json"))
}

resource "github_membership" "foundation_personnel" {
  for_each = toset(local.org_data.personnel)
  
  username = each.value
  role     = "member"
}

