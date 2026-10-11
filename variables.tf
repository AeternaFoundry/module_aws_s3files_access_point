variable "s3files_access_points" {
  description = <<EOT
Map of s3files_access_points, attributes below
Required:
    - file_system_id
Optional:
    - region
    - tags
    - posix_user (block):
        - gid (required)
        - secondary_gids (optional)
        - uid (required)
    - root_directory (block):
        - creation_permissions (optional, block):
            - owner_gid (required)
            - owner_uid (required)
            - permissions (required)
        - path (optional)
EOT

  type = map(object({
    file_system_id = string
    region         = optional(string)
    tags           = optional(map(string))
    posix_user = optional(list(object({
      gid            = number
      secondary_gids = optional(set(number))
      uid            = number
    })))
    root_directory = optional(list(object({
      creation_permissions = optional(list(object({
        owner_gid   = number
        owner_uid   = number
        permissions = string
      })))
      path = optional(string)
    })))
  }))
}

