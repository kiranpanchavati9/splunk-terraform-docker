#############################################
# IAM Outputs
#############################################

output "role_name" {
  description = "IAM Role Name"

  value = aws_iam_role.this.name
}

output "role_arn" {
  description = "IAM Role ARN"

  value = aws_iam_role.this.arn
}

output "instance_profile_name" {
  description = "IAM Instance Profile Name"

  value = aws_iam_instance_profile.this.name
}

output "instance_profile_arn" {
  description = "IAM Instance Profile ARN"

  value = aws_iam_instance_profile.this.arn
}