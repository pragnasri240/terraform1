resource "aws_instance" "name" {
  ami="ami-03695d52f0d883f65" 
  instance_type = "t3.micro"

}

resource "aws_s3_bucket" "name" {
    bucket = "tammayyaadhara"
    provider = aws.singapore
  
}