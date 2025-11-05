# Key Pair
resource "aws_key_pair" "example" {
  key_name   = "lambda-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}


resource "aws_instance" "server" {
  ami                         = "ami-04d43e494eea21db1" # amazon linux AMI
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.example.key_name
  tags = {
    Name = "key-server"
  }
  
}