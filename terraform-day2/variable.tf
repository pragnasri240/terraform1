variable "ami_id" {
    description = "passing ami values"
    default = "ami-03bec25d3c8e6cd26"
    type = string
  
}
variable "type" {
  description ="passing values to instance type"
  default = "t3.micro"
  type = string
}