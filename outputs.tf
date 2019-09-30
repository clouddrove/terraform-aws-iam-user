# Module      : Iam Role
# Description : Terraform module to create Iam Role resource on AWS.
output "arn" {
  value       = join("", aws_iam_user.default.*.arn)
  description = "The ARN assigned by AWS for this user."
}

output "key_id" {
  value       = join("", aws_iam_access_key.default.*.id)
  description = "The access key ID."
}

output "secret" {
  value       = join("", aws_iam_access_key.default.*.secret)
  description = "The secret access key. Note that this will be written to the state file. Please supply a pgp_key instead, which will prevent the secret from being stored in plain text."
}

output "tags" {
  value       = module.labels.tags
  description = "A mapping of tags to assign to the resource."
}