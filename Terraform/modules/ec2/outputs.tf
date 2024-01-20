output "instances" {
  value = aws_instance.ec2-app.*.id
}
