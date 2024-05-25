output "security_group_id" {
    description = "this is a securty group id"
    value = aws_security_group.web.id
  
}