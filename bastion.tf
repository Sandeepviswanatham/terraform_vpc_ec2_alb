#security_group
resource "aws_security_group" "bastion" {
  name        = "allow-bastion"
  description = "Allow bastion inbound traffic"
  vpc_id      ="vpc-0d62915df3fd355c8"

  ingress {
    description      = "ssh to admin"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
# # ingress {
# #     description      = "for alb end users"
# #     from_port        = 80
# #     to_port          = 80
# #     protocol         = "tcp"
# #     cidr_blocks      = ["0.0.0.0/0"]
# #     #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-sg" 
    Terraform = "true"
  }
}
resource "aws_instance" "bastion" {
  ami           ="ami-0af2f764c580cc1f9"
  instance_type = "t2.micro"
# key_name = "sandeep"
  #vpc_id ="vpc-01c7b967e5a49ca88"
  subnet_id = "subnet-03f5d7d695461abd1"
  vpc_security_group_ids = [aws_security_group.bastion.id]
  key_name = "sandeep"
#   subnet_id = "${aws_subnet.private-1b.id}" 
#  user_data = <<EOF
#             #!/bin/bash
#              yum update -y
#              yum install httpd -y 
#              systemctl enable httpd
#              systemctl start httpd
#              mkdir -p  /var/www/html/cricket/
#              echo "this is cricket" >/var/www/html/cricket/index.html
#        EOF
 
  tags = {
    Name = "bastion"
  }
}