#Provider Block
provider "aws" {
    profile = "default"
    region = var.ec2_region
}

# Creates new security group open to HTTP traffic
resource "aws_security_group" "app_sg" {
    name = "nginx_security_group"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Creates EC2 instance
resource "aws_instance" "app_instance" {
    ami = var.ec2_ami
    instance_type = "t2.micro"

    vpc_security_group_ids      = [aws_security_group.app_sg.id]
    #security_groups              = [aws_security_group.app_sg.id]

    user_data = <<-EOF
    sudo apt update
    sudo apt install nginx
    Y
    sudo ufw allow 'Nginx HTTP'
    sudo ufw enable
    y
    systemctl status nginx
    curl -4 icanhazip.com
    EOF


    tags = {
        "Name" : var.ec2_name
    }
}
