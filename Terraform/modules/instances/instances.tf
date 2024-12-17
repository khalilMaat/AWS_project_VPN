resource "aws_instance" "frontend-a" {
    ami                 = "ami-0e2c8caa4b6378d8c"
    instance_type       = "t2.meduim"
    key_name            = "aws_ssh"
    security_groups     = [module.securityGroups.normalSG.name]
    subnet_id           = module.my_vpc.public_subnetA.id
    availability_zone   = "us-east-1a"

    tags = {
        Name = "Frontend-a"
    }
}

resource "aws_instance" "frontend-b" {
    ami                 = "ami-0e2c8caa4b6378d8c"
    instance_type       = "t2.meduim"
    key_name            = "aws_ssh"
    security_groups     = [module.securityGroups.normalSG.name]
    subnet_id           = module.my_vpc.public_subnetB.id
    availability_zone   = "us-east-1b"

    tags = {
        Name = "Frontend-b"
    }
}

resource "aws_instance" "backend-a" {
    ami                 = "ami-0e2c8caa4b6378d8c"
    instance_type       = "t2.meduim"
    key_name            = "aws_ssh"
    security_groups     = [module.securityGroups.normalSG.name]
    subnet_id = module.my_vpc.private_subnetC.id
    availability_zone   = "us-east-1a"

    tags = {
        Name = "Backend-a"
    }

}
resource "aws_instance" "backend-b" {
    ami                 = "ami-0e2c8caa4b6378d8c"
    instance_type       = "t2.meduim"
    key_name            = "aws_ssh"
    security_groups     = [module.securityGroups.normalSG.name]
    subnet_id = module.my_vpc.private_subnetE.id
    availability_zone   = "us-east-1b"

    tags = {
        Name = "Backend-a"
    }

}

resource "aws_db_instance" "mydb" {
    identifier          = "mydbinstance"
    allocated_storage   = 20
    instance_class   = "db.t2.micro"
    engine              = "mysql"
    username            = "admin"
    password            = "admin"
    storage_type        = "gp2"
    publicly_accessible = false
    db_subnet_group_name = [module.my_vpc.mydb_subnet_group.id]
        

  tags = {
    Name = "MyDatabase"
  }  
}