resource "aws_instance" "ec2-app" {
  count                       = length(var.ec2_names)
  ami                         = data.aws_ami.amazon-2.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.secg_app_id, var.secg_ssh_id]
  subnet_id                   = var.subnets[count.index]
  availability_zone           = data.aws_availability_zones.available.names[count.index]
  user_data                   = <<EOF
  #!/bin/bash
  sudo yum update -y
  EOF

  tags = {
    Name = var.ec2_names[count.index]
  }
}
