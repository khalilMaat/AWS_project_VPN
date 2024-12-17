resource "aws_instance" "frontend" {
    ami         = "ami-0e2c8caa4b6378d8c"
    instance_type = "t2.meduim"
    
}