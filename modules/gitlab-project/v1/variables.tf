variable "project_name" {
  type = string
}

variable "project_path" {
  type = string
}

variable "project_desc" {
  type = string
}

variable "project_default_branch" {
  type    = string
  default = "main"
}

variable "project_namespace_id" {
  type = string
}

variable "protection_push_access_level" {
  type    = string
  default = "maintainer"
}

variable "protection_merge_access_level" {
  type    = string
  default = "maintainer"
}

variable "shared_runners_enabled" {
  type    = bool
  default = true
}
