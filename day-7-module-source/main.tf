
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "terraform-s3-bucket-pragnasridhara"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

versioning = {
    enabled = true
  }
}