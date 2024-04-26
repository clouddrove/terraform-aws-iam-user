## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| create\_iam\_user\_login\_profile | Whether to create IAM user login profile | `bool` | `true` | no |
| create\_user | Whether to create the IAM user | `bool` | `true` | no |
| delimiter | Delimiter to be used between `organization`, `environment`, `name` and `attributes`. | `string` | `"-"` | no |
| enabled | Whether to create Iam user. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| force\_destroy | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force\_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. | `bool` | `false` | no |
| groups | (Optional) List of IAM groups to add the User to. | `list(string)` | `[]` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove' | `string` | `"hello@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| password\_length | The length of the generated password | `number` | `20` | no |
| password\_reset\_required | Whether the user should be forced to reset the generated password on first login. | `bool` | `true` | no |
| path | The path to the role. | `string` | `"/"` | no |
| permissions\_boundary | The ARN of the policy that is used to set the permissions boundary for the role. | `string` | `""` | no |
| pgp\_key | Either a base-64 encoded PGP public key, or a keybase username in the form keybase:some\_person\_that\_exists. | `string` | `""` | no |
| policy | The policy document. | `any` | `null` | no |
| policy\_arn | The ARN of the policy you want to apply. | `string` | `""` | no |
| policy\_enabled | Whether to Attach Iam policy with user. | `bool` | `false` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-iam-user"` | no |
| ssh\_key\_encoding | Specifies the public key encoding format to use in the response. To retrieve the public key in ssh-rsa format, use SSH. To retrieve the public key in PEM format, use PEM | `string` | `"SSH"` | no |
| ssh\_public\_key | The SSH public key. The public key must be encoded in ssh-rsa format or PEM format | `string` | `""` | no |
| status | The access key status to apply. Defaults to Active. Valid values are Active and Inactive. | `string` | `"Active"` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(any)` | `{}` | no |
| upload\_iam\_user\_ssh\_key | Whether to upload a public ssh key to the IAM user | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN assigned by AWS for this user. |
| key\_id | The access key ID. |
| secret | The secret access key. Note that this will be written to the state file. Please supply a pgp\_key instead, which will prevent the secret from being stored in plain text. |
| tags | A mapping of tags to assign to the resource. |
| unique\_id | The unique ID assigned by AWS for this user. |

