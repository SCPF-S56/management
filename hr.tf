locals {
  hr_data = jsondecode(file("${path.module}/hr.json"))
}

resource "github_team" "hr_approvers" {
  name        = "hr-approvers"
  privacy     = "closed"
}

resource "github_team_membership" "hr_approvers" {
  for_each = toset(local.hr_data.approvers)
  
  team_id  = github_team.hr_approvers.id
  username = each.value
  role     = "member"
}

resource "github_team_repository" "hr_management_access" {
  team_id    = github_team.hr_approvers.id
  repository = "management"
  permission = "push"
}

