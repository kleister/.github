data "github_repositories" "available" {
  query = "org:kleister"
}

locals {
  repository_labels = flatten([
    for repository in data.github_repositories.available.names : [
      for index, label in var.labels : [
        {
          name        = "${repository}-${label.name}"
          repository  = repository
          label       = label.name
          description = label.description
          color       = label.color
        }
      ]
    ]
  ])
}

resource "github_issue_label" "general" {
  for_each = { for row in local.repository_labels : row.name => row }

  repository  = each.value.repository
  name        = each.value.label
  description = each.value.description
  color       = each.value.color
}

resource "github_branch_default" "general" {
  for_each = { for row in data.github_repositories.available.names : row => row }

  repository = each.value
  branch     = "master"
}
