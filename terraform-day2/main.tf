resource "aws_instance" "name" {
  ami = "ami-03bec25d3c8e6cd26"
  instance_type = "t3.micro"
    tags = {
      Name = "terraform"
    }
}