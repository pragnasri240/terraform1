resource "aws_instance" "lifecycle" {
    ami = "ami-0609186b60570e9c9"
    instance_type = "t3.micro"
    tags = {
        Name = "lifecycle"
    }
  

  # lifecycle {
    #   create_before_destroy = true
    # }
    #lifecycle {
    # ignore_changes = [tags,  ]
    #}
    # lifecycle {
    #   prevent_destroy = true
    # }
  
}