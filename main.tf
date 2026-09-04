locals {
  common_tags = {
    cost-centre      = var.tags.cost-centre
    account-code     = var.tags.account-code
    portfolio-id     = var.tags.portfolio-id
    project-id       = var.tags.project-id
    service-id       = var.tags.service-id
    owner-business   = var.tags.owner-business
    budget-holder    = var.tags.budget-holder
    environment-type = var.tags.environment-type
  }
}

module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role" #checkov:skip=CKV_TF_1:Terraform Registry module - version is pinned via the version attribute
  version = "6.8.1"

  create               = var.create
  name                 = var.name
  use_name_prefix      = var.use_name_prefix
  path                 = var.path
  description          = var.description
  max_session_duration = var.max_session_duration
  permissions_boundary = var.permissions_boundary

  trust_policy_permissions = var.trust_policy_permissions
  trust_policy_conditions  = var.trust_policy_conditions
  policies                 = var.policies

  enable_oidc            = var.enable_oidc
  oidc_account_id        = var.oidc_account_id
  oidc_provider_urls     = var.oidc_provider_urls
  oidc_subjects          = var.oidc_subjects
  oidc_wildcard_subjects = var.oidc_wildcard_subjects
  oidc_audiences         = var.oidc_audiences

  enable_github_oidc = var.enable_github_oidc
  github_provider    = var.github_provider

  create_inline_policy             = var.create_inline_policy
  source_inline_policy_documents   = var.source_inline_policy_documents
  override_inline_policy_documents = var.override_inline_policy_documents
  inline_policy_permissions        = var.inline_policy_permissions

  create_instance_profile = var.create_instance_profile

  tags = merge(var.tags, local.common_tags)
}
