provider "aws" {
  region = "eu-west-1"
}

module "iam-user" {
  source = "../"

  name        = "iam-user"
  environment = "test"
  label_order = ["name", "environment"]

  policy_enabled          = true
  policy                  = data.aws_iam_policy_document.default.json
  pgp_key                 = ""
  password_length         = 20
  password_reset_required = true
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ec2:Describe*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}
