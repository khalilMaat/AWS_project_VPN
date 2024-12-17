resource "aws_security_group" "normalSG" {
    vpc_id = module.vpc.my_vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = -1
        to_port     = -1
        protocol    = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
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