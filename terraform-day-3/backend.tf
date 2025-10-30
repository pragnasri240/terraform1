terraform {
  backend "s3" {
    bucket = "sripragnashama"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}