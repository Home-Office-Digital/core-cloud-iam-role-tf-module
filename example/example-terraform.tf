module "iam_roles" {
  source = "../"

  name               = "project-example"
  enable_github_oidc = false

  trust_policy_permissions = {
    TrustRoleAndServiceToAssume = {
      actions = [
        "sts:AssumeRole",
        "sts:TagSession",
      ]
      principals = [{
        type = "AWS"
        identifiers = [
          "arn:aws:iam::<account-number>:user/test-user",
        ]
      }]
      condition = [{
        test     = "StringEquals"
        variable = "sts:ExternalId"
        values   = ["some-secret-id"]
      }]
    }
  }

  policies = {
    AmazonS3ReadOnly        = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
    SecretsManagerReadWrite = "arn:aws:iam::aws:policy/SecretsManagerReadWrite" #checkov:skip=CKV_SECRET_6:False positive - this is an AWS managed policy ARN, not a secret
    custom                  = aws_iam_policy.this.arn
  }

  tags = {
    cost-centre      = "..."
    account-code     = "..."
    portfolio-id     = "..."
    project-id       = "..."
    service-id       = "..."
    owner-business   = "..."
    budget-holder    = "..."
    environment-type = "..."
  }
}
