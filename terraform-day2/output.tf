output "pragna" {
    value = aws_instance.name.public_ip
  
}
output "sri" {
    value = aws_instance.name.availability_zone
  
}
output "teja" {
    value = aws_instance.name.private_ip
  
}
