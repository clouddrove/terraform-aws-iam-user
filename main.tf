# Managed By : CloudDrove
# Description : Terraform module to create IAM user resource on AWS.
# Copyright @ CloudDrove. All Right Reserved.

#Module      : label
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.


module "labels" {
  source  = "clouddrove/labels/aws"
  version = "0.15.0"

  name        = var.name
  environment = var.environment
  repository  = var.repository
  managedby   = var.managedby
  attributes  = var.attributes
  label_order = var.label_order
}

# Module      : IAM user
# Description : Terraform module to create IAm user resource on AWS.
resource "aws_iam_user" "default" {
  count = var.enabled ? 1 : 0

  name                 = module.labels.id
  force_destroy        = var.force_destroy
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  tags                 = module.labels.tags
}

resource "aws_iam_access_key" "default" {
  count = var.enabled ? 1 : 0

  user    = aws_iam_user.default.*.name[0]
  pgp_key = var.pgp_key
  status  = var.status
}

resource "aws_iam_user_policy" "default" {
  count = var.enabled && var.policy_enabled && var.policy_arn == "" ? 1 : 0

  name   = format("%s-policy", module.labels.id)
  user   = aws_iam_user.default.*.name[0]
  policy = var.policy
}

resource "aws_iam_user_policy_attachment" "default" {
  count = var.enabled && var.policy_enabled && var.policy_arn != "" ? 1 : 0

  user       = aws_iam_user.default.*.name[0]
  policy_arn = var.policy_arn
}

resource "aws_iam_user_group_membership" "default" {
  count      = var.enabled ? 1 : 0
  user       = aws_iam_user.default[count.index].name
  groups     = var.groups
  depends_on = [aws_iam_user.default]
}

resource "aws_iam_user_login_profile" "default" {
  count = var.create_user && var.create_iam_user_login_profile ? 1 : 0

  user                    = aws_iam_user.default[0].name
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
}

resource "aws_iam_user_ssh_key" "default" {
  count = var.create_user && var.upload_iam_user_ssh_key ? 1 : 0

  username   = aws_iam_user.default[0].name
  encoding   = var.ssh_key_encoding
  public_key = var.ssh_public_key
}