# Creating an AWS instance! It should be launched in the private subnet!
resource "aws_instance" "instance1" {
  depends_on = [
    aws_vpc.dev,
    aws_subnet.dev-private-2,
    aws_subnet.dev-private-1,
  ]

  # Using my custom Private AMI which has most of the things configured for WordPress
  # i.e. instance1 Installed!
  ami = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.dev-private-1.id

  
  # Attaching 2 security groups here, 1 for the inctance1 Database access by the Web-servers,
  # & other one for the Bastion Host access for applying updates & patches!
  vpc_security_group_ids = [aws_security_group.instance1-SG.id,]

  tags = {
   Name = "instance1_From_Terraform"
  }
}