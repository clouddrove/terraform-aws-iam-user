# Module      : Iam Role
# Description : Terraform module to create Iam Role resource on AWS.
output "arn" {
  value       = join("", aws_iam_user.default.*.arn)
  description = "The ARN assigned by AWS for this user."
}

output "unique_id" {
  value       = join("", aws_iam_user.default.*.unique_id)
  description = "The unique ID assigned by AWS for this user."
}

output "key_id" {
  value       = join("", aws_iam_access_key.default.*.id)
  description = "The access key ID."
}

output "secret" {
  value       = var.pgp_key == "" ? join("", aws_iam_access_key.default.*.secret) : join("", aws_iam_access_key.default.*.encrypted_secret)
  description = "The secret access key. Note that this will be written to the state file. Please supply a pgp_key instead, which will prevent the secret from being stored in plain text."
  sensitive   = true
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}

output "groups" {
   value       = var.groups
  description = "List of IAM groups the users were added to."
}

