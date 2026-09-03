# core-cloud-iam-role-tf-module

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_role"></a> [iam\_role](#module\_iam\_role) | terraform-aws-modules/iam/aws//modules/iam-role | 6.2.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Controls if resources should be created (affects all resources) | `bool` | `true` | no |
| <a name="input_create_inline_policy"></a> [create\_inline\_policy](#input\_create\_inline\_policy) | Determines whether to create an inline policy | `bool` | `false` | no |
| <a name="input_create_instance_profile"></a> [create\_instance\_profile](#input\_create\_instance\_profile) | Determines whether to create an instance profile | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the role | `string` | `null` | no |
| <a name="input_enable_github_oidc"></a> [enable\_github\_oidc](#input\_enable\_github\_oidc) | Enable GitHub OIDC provider trust for the role | `bool` | `false` | no |
| <a name="input_enable_oidc"></a> [enable\_oidc](#input\_enable\_oidc) | Enable OIDC provider trust for the role | `bool` | `false` | no |
| <a name="input_github_provider"></a> [github\_provider](#input\_github\_provider) | The GitHub OIDC provider URL *without the `https://` prefix | `string` | `"token.actions.githubusercontent.com"` | no |
| <a name="input_inline_policy_permissions"></a> [inline\_policy\_permissions](#input\_inline\_policy\_permissions) | A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for inline policy permissions | <pre>map(object({<br/>    sid           = optional(string)<br/>    actions       = optional(list(string))<br/>    not_actions   = optional(list(string))<br/>    effect        = optional(string, "Allow")<br/>    resources     = optional(list(string))<br/>    not_resources = optional(list(string))<br/>    principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    not_principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    condition = optional(list(object({<br/>      test     = string<br/>      variable = string<br/>      values   = list(string)<br/>    })))<br/>  }))</pre> | `null` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to use on IAM role created | `string` | `null` | no |
| <a name="input_oidc_account_id"></a> [oidc\_account\_id](#input\_oidc\_account\_id) | An overriding AWS account ID where the OIDC provider lives; leave empty to use the current account ID for the AWS provider | `string` | `null` | no |
| <a name="input_oidc_audiences"></a> [oidc\_audiences](#input\_oidc\_audiences) | The audience to be added to the role policy. Set to sts.amazonaws.com for cross-account assumable role. Leave empty otherwise. | `list(string)` | `[]` | no |
| <a name="input_oidc_provider_urls"></a> [oidc\_provider\_urls](#input\_oidc\_provider\_urls) | List of URLs of the OIDC Providers | `list(string)` | `[]` | no |
| <a name="input_oidc_subjects"></a> [oidc\_subjects](#input\_oidc\_subjects) | The fully qualified OIDC subjects to be added to the role policy | `list(string)` | `[]` | no |
| <a name="input_oidc_wildcard_subjects"></a> [oidc\_wildcard\_subjects](#input\_oidc\_wildcard\_subjects) | The OIDC subject using wildcards to be added to the role policy | `list(string)` | `[]` | no |
| <a name="input_override_inline_policy_documents"></a> [override\_inline\_policy\_documents](#input\_override\_inline\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid` | `list(string)` | `[]` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of IAM role | `string` | `null` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | ARN of the policy that is used to set the permissions boundary for the IAM role | `string` | `null` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | Policies to attach to the IAM role in `{'static_name' = 'policy_arn'}` format | `map(string)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-west-2"` | no |
| <a name="input_source_inline_policy_documents"></a> [source\_inline\_policy\_documents](#input\_source\_inline\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | <pre>object({<br/>    # enforced tags, all required attributes for costing and ID<br/>    cost_centre     = string<br/>    account_code    = string<br/>    portfolio_id    = string<br/>    project_id      = string<br/>    service_id      = string<br/>    owner-business  = string<br/>    budget-holder   = string<br/>    environment-type = string<br/>  })</pre> | n/a | yes |
| <a name="input_trust_policy_conditions"></a> [trust\_policy\_conditions](#input\_trust\_policy\_conditions) | [Condition constraints](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#condition) applied to the trust policy(s) enabled | <pre>list(object({<br/>    test     = string<br/>    variable = string<br/>    values   = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_trust_policy_permissions"></a> [trust\_policy\_permissions](#input\_trust\_policy\_permissions) | A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom trust policy permissions | <pre>map(object({<br/>    sid           = optional(string)<br/>    actions       = optional(list(string))<br/>    not_actions   = optional(list(string))<br/>    effect        = optional(string, "Allow")<br/>    resources     = optional(list(string))<br/>    not_resources = optional(list(string))<br/>    principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    not_principals = optional(list(object({<br/>      type        = string<br/>      identifiers = list(string)<br/>    })))<br/>    condition = optional(list(object({<br/>      test     = string<br/>      variable = string<br/>      values   = list(string)<br/>    })))<br/>  }))</pre> | `null` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether `name` is used as-is (the IAM role's exact name) or as a prefix that AWS appends a random suffix to | `bool` | `true` | no |

## Outputs

No outputs.
