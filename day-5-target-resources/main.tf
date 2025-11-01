


resource "aws_instance" "name" {
    ami = "ami-0609186b60570e9c9"
    instance_type = "t3.micro"
    availability_zone = "ap-southeast-1a"
    tags = {
        Name = "target-resource"
    }

}

resource "aws_s3_bucket" "name" {
    bucket = "qwertyyuuiokjhh"
  

}
