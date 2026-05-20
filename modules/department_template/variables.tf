variable "department_name" {
  description = "The name of the department (used for naming teams and repos)"
  type        = string
}

variable "approvers" {
  description = "List of GitHub usernames that have maintainer access"
  type        = list(string)
}

variable "members" {
  description = "List of GitHub usernames that have read-only access"
  type        = list(string)
}

