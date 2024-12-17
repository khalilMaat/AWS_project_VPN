resource "aws_key_pair" "my_key_pair" {
    key_name = "my-key-pair"
    public_key = file("/media/ubuntu/ACB2AB37B2AB04C41/Users/PC/Desktop/DevOps Configuration/AWS_project_VPN/aws_ssh.pem")
}