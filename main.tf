# The main.tf will contain the main set of configuration for your module. You can also create other configuration files and organize them however makes sense for your project.

locals {
  common_tags = {
    cost-centre      = var.tags.cost_centre
    account-code     = var.tags.account_code
    portfolio-id     = var.tags.portfolio_id
    project-id       = var.tags.project_id
    service-id       = var.tags.service_id
    owner-business   = var.tags.owner-business
    budget-holder    = var.tags.budget-holder
    environment-type = var.tags.envionment-type
  }
}

module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role" #checkov:skip=CKV_TF_1:Terraform Registry module - version is pinned via the version attribute
  version = "6.8.0"

  tags = merge(local.common_tags)
}
