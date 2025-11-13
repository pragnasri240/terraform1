###########################
# 1. IAM USER
###########################
resource "aws_iam_user" "this" {
  name = var.user_name
  path = "/"
  tags = {
    Environment = "dev"
  }
}

###########################
# 2. IAM GROUP
###########################
resource "aws_iam_group" "this" {
  name = var.group_name
}

###########################
# 3. ADD USER TO GROUP
###########################
resource "aws_iam_group_membership" "this" {
  name  = "group-membership"
  users = [aws_iam_user.this.name]
  group = aws_iam_group.this.name
}

###########################
# 4. CUSTOM IAM POLICY
###########################
resource "aws_iam_policy" "s3_full_access" {
  name        = var.policy_name
  description = "Provides full access to S3"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:*"]
        Resource = "*"
      }
    ]
  })
}

###########################
# 5. ATTACH POLICY TO GROUP
###########################
resource "aws_iam_group_policy_attachment" "this" {
  group      = aws_iam_group.this.name
  policy_arn = aws_iam_policy.s3_full_access.arn
}

###########################
# 6. IAM ROLE (for EC2)
###########################
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

###########################
# 7. ATTACH MANAGED POLICY TO ROLE
###########################
resource "aws_iam_role_policy_attachment" "ec2_attach" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

###########################
# 8. IAM INSTANCE PROFILE
###########################
resource "aws_iam_instance_profile" "this" {
  name = "ec2-instance-profile"
  role = aws_iam_role.this.name
}

     