provider "aws" {
  region = "eu-west-1"
}

module "iam-user" {
  source = "../"

  name        = "iam-user"
  repository  = "https://registry.terraform.io/modules/clouddrove/iam-user/aws/0.14.0"
  environment = "test"
  label_order = ["name", "environment"]

  policy_enabled = true
  policy         = data.aws_iam_policy_document.default.json
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