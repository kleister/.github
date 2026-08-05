variable "members" {
  description = "List of GitHub organization members"
  type = list(object({
    name = string
    role = string
  }))
  default = [
    {
      name = "kleisterz"
      role = "admin"
    },
    {
      name = "tboerger"
      role = "admin"
    },
  ]
}

variable "teams" {
  description = "List of GitHub teams with members"
  type = list(object({
    name       = string
    privacy    = string
    permission = string
    members = list(object({
      name = string
      role = string
    }))
  }))
  default = [
    {
      name       = "admins"
      privacy    = "closed"
      permission = "admin"
      members = [
        {
          name = "kleisterz"
          role = "maintainer"
        },
        {
          name = "tboerger"
          role = "maintainer"
        },
      ]
    },
    {
      name       = "bots"
      privacy    = "closed"
      permission = "admin"
      members = [
        {
          name = "kleisterz"
          role = "maintainer"
        },
      ]
    },
    {
      name       = "members"
      privacy    = "closed"
      permission = "maintain"
      members = [
        {
          name = "tboerger"
          role = "maintainer"
        },
      ]
    },
  ]
}
