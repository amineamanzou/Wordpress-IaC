output "secg_lb_id" {
  value = aws_security_group.secg-lb.id
}

output "secg_ssh_id" {
  value = aws_security_group.secg-ssh.id
}

output "secg_app_id" {
  value = aws_security_group.secg-app.id
}

output "secg_db_id" {
  value = aws_security_group.secg-db.id
}
