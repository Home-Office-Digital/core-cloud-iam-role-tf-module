variable "create" {
  description = "Controls if resources should be created (affects all resources)"
  type        = bool
  default     = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}

variable "path" {
  description = "Path of IAM role"
  type        = string
  default     = null
}

variable "use_name_prefix" {
  description = "Determines whether the name is used as a prefix (and a random unique ID is used as a suffix, or whether the name is exactly the same as what you specified)"
  type        = bool
  default     = true
}

variable "description" {
  description = "Description of the role"
  type        = string
  default     = null
}

variable "max_session_duration" {
  description = "Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours"
  type        = number
  default     = null
}

variable "permissions_boundary" {
  description = "ARN of the policy that is used to set the permissions boundary for the IAM role"
  type        = string
  default     = null
}

variable "trust_policy_permissions" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom trust policy permissions"
  type = map(object({
    sid           = optional(string)
    actions       = optional(list(string))
    not_actions   = optional(list(string))
    effect        = optional(string, "Allow")
    resources     = optional(list(string))
    not_resources = optional(list(string))
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    not_principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    condition = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })))
  }))
  default = null
}

variable "trust_policy_conditions" {
  description = "[Condition constraints](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#condition) applied to the trust policy(s) enabled"
  type = list(object({
    test     = string
    variable = string
    values   = list(string)
  }))
  default = []
}

variable "policies" {
  description = "Policies to attach to the IAM role in `{'static_name' = 'policy_arn'}` format"
  type        = map(string)
  default     = {}
}

variable "enable_oidc" {
  description = "Enable OIDC provider trust for the role"
  type        = bool
  default     = false
}

variable "oidc_account_id" {
  description = "An overriding AWS account ID where the OIDC provider lives; leave empty to use the current account ID for the AWS provider"
  type        = string
  default     = null
}

variable "oidc_provider_urls" {
  description = "List of URLs of the OIDC Providers"
  type        = list(string)
  default     = []
}

variable "oidc_subjects" {
  description = "The fully qualified OIDC subjects to be added to the role policy"
  type        = list(string)
  default     = []
}

variable "oidc_wildcard_subjects" {
  description = "The OIDC subject using wildcards to be added to the role policy"
  type        = list(string)
  default     = []
}

variable "oidc_audiences" {
  description = "The audience to be added to the role policy. Set to sts.amazonaws.com for cross-account assumable role. Leave empty otherwise."
  type        = list(string)
  default     = []
}

variable "github_provider" {
  description = "The GitHub OIDC provider URL *without the `https://` prefix"
  type        = string
  default     = "token.actions.githubusercontent.com"
}

variable "enable_github_oidc" {
  description = "Enable GitHub OIDC provider trust for the role"
  type        = bool
  default     = false
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

################################################################################
# IAM Role Inline policy
################################################################################

variable "create_inline_policy" {
  description = "Determines whether to create an inline policy"
  type        = bool
  default     = false
}

variable "source_inline_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "override_inline_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

variable "inline_policy_permissions" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for inline policy permissions"
  type = map(object({
    sid           = optional(string)
    actions       = optional(list(string))
    not_actions   = optional(list(string))
    effect        = optional(string, "Allow")
    resources     = optional(list(string))
    not_resources = optional(list(string))
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    not_principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    condition = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })))
  }))
  default = null
}

################################################################################
# IAM Instance Profile
################################################################################

variable "create_instance_profile" {
  description = "Determines whether to create an instance profile"
  type        = bool
  default     = false
}


