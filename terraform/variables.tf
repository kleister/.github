variable "members" {
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
