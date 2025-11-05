provider "aws" {
  region = "ap-south-1"  # change as needed
}

# 1️⃣ Create S3 bucket for Lambda code
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-sourcebuckettt"  # must be globally unique
}

# 2️⃣ Upload Lambda zip file to S3
resource "aws_s3_object" "lambda_code" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "lambda_function.zip"
  source = "lambda_function.zip"     # local file to upload
  etag   = filemd5("lambda_function.zip")
}

# 3️⃣ IAM role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role1"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# 4️⃣ Attach basic Lambda execution policy
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# 5️⃣ Create Lambda function from S3 source
resource "aws_lambda_function" "example" {
  function_name = "my-lambda-s3-source"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key    = aws_s3_object.lambda_code.key

  environment {
    variables = {
      ENV = "dev"
    }
  }
}
