output "security_group_ids" {
  value = [aws_security_group.allow_all.id] # Outputs the security group ID so other
}                                           # modules (like EC2) can use it.

