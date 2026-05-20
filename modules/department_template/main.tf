resource "github_team" "approvers" {
  name        = "${var.department_name}-approvers"
  privacy     = "closed"
}

resource "github_team_membership" "approvers" {
  for_each = toset(var.approvers)
  team_id  = github_team.approvers.id
  username = each.value
  role     = "member"
}

resource "github_team" "members" {
  name        = "${var.department_name}-members"
  privacy     = "closed"
}

resource "github_team_membership" "members" {
  for_each = toset(var.members)
  team_id  = github_team.members.id
  username = each.value
  role     = "member"
}

resource "github_repository" "dept_repo" {
  name        = "${var.department_name}-docs"
  visibility  = "private"
  has_issues  = true
}

resource "github_team_repository" "approver_access" {
  team_id    = github_team.approvers.id
  repository = github_repository.dept_repo.name
  permission = "maintain"
}

resource "github_team_repository" "member_access" {
  team_id    = github_team.members.id
  repository = github_repository.dept_repo.name
  permission = "pull"
}

