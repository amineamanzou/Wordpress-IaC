# Security Group
resource "aws_security_group" "secg-lb" {
  name        = "secg-lb"
  description = "SG for LB instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow inbound trafic from anywhere to HTTPS port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow inbound trafic from anywhere to HTTP port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound trafic to anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "secg_lb"
  }
}

resource "aws_security_group" "secg-app" {
  name        = "secg-app"
  description = "SG for app instance"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow inbound trafic from LB to HTTP port"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.secg-lb.id]
  }

  egress {
    description = "Allow outbound HTTPS from HTTPS to anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "secg_app"
  }
}

resource "aws_security_group" "secg-db" {
  name        = "secg-db"
  description = "SG for db instance"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow inbound trafic from app to MYSQL port"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.secg-app.id]
  }

  egress {
    description     = "Allow outbound trafic from MYSQL to app instance"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.secg-app.id]
  }

  tags = {
    "Name" = "secg_db"
  }
}

resource "aws_security_group" "secg-ssh" {
  name        = "secg-ssh"
  description = "Allow SSH connection"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow inbound traffic from anywhere to SSH port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic from SSH port to anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "secg-ssh"
  }
}
