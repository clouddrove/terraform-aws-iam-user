#Module      : LABEL
#Description : Terraform label module variables
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}
variable "repository" {
  type        = string
  default     = "https://github.com/clouddrove/terraform-aws-iam-user"
  description = "Terraform current module repo"
}


variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "attributes" {
  type        = list(any)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `organization`, `environment`, `name` and `attributes`."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'"
}

# Module      : Iam Role
# Description : Terraform Iam Role module variables.
variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create Iam user."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
}

variable "path" {
  type        = string
  default     = "/"
  description = "The path to the role."
}

variable "permissions_boundary" {
  type        = string
  default     = ""
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  sensitive   = true
}

variable "pgp_key" {
  type        = string
  default     = ""
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some_person_that_exists."
  sensitive   = true
}

variable "status" {
  type        = string
  default     = "Active"
  description = "The access key status to apply. Defaults to Active. Valid values are Active and Inactive."
}

variable "policy" {
  default     = null
  description = "The policy document."
}

variable "policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to Attach Iam policy with user."
}

variable "policy_arn" {
  type        = string
  default     = ""
  description = "The ARN of the policy you want to apply."
  sensitive   = true
}

variable "groups" {
  type        = list(string)
  default     = []
  description = "(Optional) List of IAM groups to add the User to."
}

variable "create_user" {
  type        = bool
  default     = true
  description = "Whether to create the IAM user"
}

variable "create_iam_user_login_profile" {
  type        = bool
  default     = true
  description = "Whether to create IAM user login profile"
}

variable "password_reset_required" {
  type        = bool
  default     = true
  description = "Whether the user should be forced to reset the generated password on first login."
}

variable "password_length" {
  type        = number
  default     = 20
  description = "The length of the generated password"
}

variable "upload_iam_user_ssh_key" {
  type        = bool
  default     = false
  description = "Whether to upload a public ssh key to the IAM user"
}
variable "ssh_key_encoding" {
  type        = string
  default     = "SSH"
  description = "Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM"
}

variable "ssh_public_key" {
  type        = string
  default     = ""
  description = "The SSH public key. The public key must be encoded in ssh-rsa format or PEM format"
}

