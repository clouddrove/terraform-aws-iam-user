output "arn" {
  value       = module.iam-user.*.arn
  description = "The ARN assigned by AWS for this user."
}

output "key_id" {
  value       = module.iam-user.*.key_id
  description = "The ARN assigned by AWS for this user."
}

output "secret" {
  value       = module.iam-user.*.secret
  description = "The ARN assigned by AWS for this user."
}

output "tags" {
  value       = module.iam-user.tags
  description = "A mapping of tags to assign to the resource."
}