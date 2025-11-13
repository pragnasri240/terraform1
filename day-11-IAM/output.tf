output "iam_user_name" {
  value = aws_iam_user.this.name
}

output "iam_group_name" {
  value = aws_iam_group.this.name
}

output "iam_role_arn" {
  value = aws_iam_role.this.arn
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.this.name
}
