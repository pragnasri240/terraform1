# resource "aws_instance" "name" {
#     ami = "ami-03695d52f0d883f65"
#     instance_type = "t3.micro"
#     count = 2
#      tags = {
#        Name = "dev-${count.index}"
    
# }
#}
variable "env" {
    type = list(string)
    default = [ "dev","prod",]
  
}

resource "aws_instance" "name" {
   ami = "ami-03695d52f0d883f65"
   instance_type = "t3.micro"
   count = length(var.env)
    #tags = {
      #Name = "dev"
    #}
  tags = {
     Name = var.env[count.index]
    }
}