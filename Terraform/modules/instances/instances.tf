resource "aws_instance" "frontend-a" {
    ami                     = "ami-0e2c8caa4b6378d8c"
    instance_type           = "t2.medium"
    key_name                = "aws_ssh"
    security_groups         = var.security_groups
    subnet_id               = var.public_subnetA
    availability_zone       = "us-east-1a"
    #spot_price              = "0.03"
    #block_duration_minutes  = 360 # 6 hours
    instance_market_options {
        market_type = "spot"
    spot_options {
      max_price = "0.0031" # Maximum hourly price you're willing to pay
      valid_until = timestamp() + var.valid_duration_hours * 3600 # 6 hours from now
    }
  }
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
    instance_market_options {
        market_type = "spot"
    spot_options {
      max_price = "0.0031" # Maximum hourly price you're willing to pay
      valid_until = timestamp() + var.valid_duration_hours * 3600 # 6 hours from now
    }
  }

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
