resource "github_team" "general" {
  for_each = { for row in var.teams : row.name => row }

  name    = each.value.name
  privacy = each.value.privacy
}

resource "github_team_members" "general" {
  for_each = { for row in var.teams : row.name => row }
  team_id  = github_team.general[each.value.name].id

  dynamic "members" {
    for_each = each.value.members

    content {
      username = members.value.name
      role     = members.value.role
    }
  }
}
