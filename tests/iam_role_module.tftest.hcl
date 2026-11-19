mock_provider "aws" {
  mock_data "aws_caller_identity" {
    defaults = {
      account_id = "123456789012"
      arn        = "arn:aws:iam::123456789012:user/mock"
      id         = "123456789012"
      user_id    = "AIDAEXAMPLE123456789"
    }
  }

  mock_data "aws_partition" {
    defaults = {
      dns_suffix         = "amazonaws.com"
      id                 = "aws"
      partition          = "aws"
      reverse_dns_prefix = "com.amazonaws"
    }
  }

  mock_data "aws_iam_policy_document" {
    defaults = {
      json          = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
      minified_json = "{\"Version\":\"2012-10-17\",\"Statement\":[]}"
    }
  }
}

run "test_required_tags_and_metadata" {
  command = apply
  variables {
    tags = {
      environment-type = "test-env"
      cost-centre      = "cc123"
      account-code     = "ac456"
      portfolio-id     = "pf789"
      project-id       = "pj101"
      service-id       = "svc202"
      owner-business   = "owner1"
      budget-holder    = "holder2"
    }
    name                 = "test-role"
    path                 = "/service/"
    description          = "Test IAM role"
    max_session_duration = 3600
    permissions_boundary = "arn:aws:iam::aws:policy/AdministratorAccess"
  }
  assert {
    condition     = output.name != null
    error_message = "Output name should not be null when create is true."
  }
  assert {
    condition     = output.arn != null
    error_message = "Output arn should not be null when create is true."
  }
  assert {
    condition     = output.resource_id != ""
    error_message = "Output resource_id should not be empty when create is true."
  }
}

run "test_resource_creation_toggle" {
  command = apply
  variables {
    create = false
    tags = {
      environment-type = "test-env"
      cost-centre      = "cc123"
      account-code     = "ac456"
      portfolio-id     = "pf789"
      project-id       = "pj101"
      service-id       = "svc202"
      owner-business   = "owner1"
      budget-holder    = "holder2"
    }
  }
  assert {
    condition     = output.resource_id == null
    error_message = "Resources should not be created when create is false."
  }
}

run "test_use_name_prefix_opt_out" {
  command = apply
  variables {
    name            = "test-role-exact-name"
    use_name_prefix = false
    tags = {
      environment-type = "test-env"
      cost-centre      = "cc123"
      account-code     = "ac456"
      portfolio-id     = "pf789"
      project-id       = "pj101"
      service-id       = "svc202"
      owner-business   = "owner1"
      budget-holder    = "holder2"
    }
  }
  assert {
    condition     = output.name == "test-role-exact-name"
    error_message = "Setting use_name_prefix = false should produce an exact IAM role name, not a name_prefix with an AWS-appended random suffix."
  }
}

run "test_iam_role_outputs" {
  command = apply
  variables {
    name = "test-role-outputs"
    tags = {
      environment-type = "test-env"
      cost-centre      = "cc123"
      account-code     = "ac456"
      portfolio-id     = "pf789"
      project-id       = "pj101"
      service-id       = "svc202"
      owner-business   = "owner1"
      budget-holder    = "holder2"
    }
  }
  assert {
    condition     = output.resource_id != ""
    error_message = "Output resource_id should not be empty."
  }
}
