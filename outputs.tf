output "name" {
  description = "The name of the IAM role"
  value       = module.iam_role.name
}

output "arn" {
  description = "The ARN of the IAM role"
  value       = module.iam_role.arn
}

output "resource_id" {
  description = "Stable and unique string identifying the IAM role"
  value       = module.iam_role.unique_id
}

output "unique_id" {
  description = "Stable and unique string identifying the IAM role"
  value       = module.iam_role.unique_id
}

output "instance_profile_arn" {
  description = "ARN assigned by AWS to the instance profile"
  value       = module.iam_role.instance_profile_arn
}

output "instance_profile_id" {
  description = "Instance profile ID"
  value       = module.iam_role.instance_profile_id
}

output "instance_profile_name" {
  description = "Name of IAM instance profile"
  value       = module.iam_role.instance_profile_name
}

output "instance_profile_unique_id" {
  description = "Stable and unique string identifying the IAM instance profile"
  value       = module.iam_role.instance_profile_unique_id
}
