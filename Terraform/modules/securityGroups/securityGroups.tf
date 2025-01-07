resource "aws_security_group" "normalSG" {
    name        = "normalSG"
    vpc_id      = var.vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH access from anywhere"
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow tomcat port"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = -1
        to_port     = -1
        protocol    = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow icmp for ping"
    }
    ingress {
        from_port   = 1194 
        to_port     = 1194
        protocol    = "UDP"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow for OpenVPN port"
    }
    # Outbound (egress) rule
    egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"  # -1 allows all protocols
      cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "normalSG"
    }
}

output "normalSG_id" {
  value = aws_security_group.normalSG.id
}