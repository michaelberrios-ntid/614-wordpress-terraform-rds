output "web_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "db_sg_id" {
  value = aws_security_group.rds_sg.id
}