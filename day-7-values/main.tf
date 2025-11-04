module "name" {
  source = "../day-7-modules"     #added day-2 update omly instance
  ami_id = "ami-01760eea5c574eb86"
  type = "t3.micro"
}