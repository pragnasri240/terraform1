variable "ami_id" {
    description = "passing ami values"
    default = "ami-04d43e494eea21db1"
    type = string
  
}
variable "type" {
    description = "passing values to instance type"
    default = "t3.micro"
    type = string
  
}