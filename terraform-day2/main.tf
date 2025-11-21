resource "aws_instance" "name" {
  ami = "ami-0d176f79571d18a8f"
  instance_type = "t3.micro"
    tags = {
      Name = "terraform"
    }
}
