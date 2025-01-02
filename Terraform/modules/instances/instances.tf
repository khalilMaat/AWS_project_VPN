resource "aws_instance" "frontend-a" {
    ami                     = "ami-0e2c8caa4b6378d8c"
    instance_type           = "t2.medium"
    key_name                = "aws_ssh"
    security_groups         = var.security_groups
    subnet_id               = var.public_subnetA
    availability_zone       = "us-east-1a"
   
   
    tags = {
        Name = "Frontend-a"
    }
}

resource "aws_instance" "frontend-b" {
    ami                     = "ami-0e2c8caa4b6378d8c"
    instance_type           = "t2.medium"
    key_name                = "aws_ssh"
    security_groups         = var.security_groups
    subnet_id               = var.public_subnetB
    availability_zone       = "us-east-1b"
    

    tags = {
        Name = "Frontend-b"
    }
}

resource "aws_instance" "backend-a" {
    ami                 = "ami-0e2c8caa4b6378d8c"
    instance_type       = "t2.medium"
    key_name            = "aws_ssh"
    security_groups     = var.security_groups
    subnet_id           = var.private_subnetC
    availability_zone   = "us-east-1a"

    tags = {
        Name = "Backend-a"
    }

}
resource "aws_instance" "backend-b" {
    ami                 = "ami-0e2c8caa4b6378d8c"
    instance_type       = "t2.medium"
    key_name            = "aws_ssh"
    security_groups     = var.security_groups
    subnet_id           = var.private_subnetE
    availability_zone   = "us-east-1b"

    tags = {
        Name = "Backend-b"
    }

}

output "frontend_a" {
  value = aws_instance.frontend-a.id
}
output "frontend_b" {
  value = aws_instance.frontend-b.id
}
output "backend-a" {
  value = aws_instance.backend-a.id
}
output "backend-b" {
  value = aws_instance.backend-b.id
}