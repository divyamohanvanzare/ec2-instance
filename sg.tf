# Creating security group for instance1, this will allow access only from the instances having the security group created above.
resource "aws_security_group" "instance1-SG" {

  depends_on = [
    aws_vpc.dev,
    //aws_subnet.dev-private-2,
    //aws_subnet.dev-private-1,
  ]

  description = "instance1 Access only from the Webserver Instances!"
  name = "instance1-sg"
  vpc_id = aws_vpc.dev.id

  # Created an inbound rule for instance1
  ingress {
    description = "instance1 Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   
  ingress {
    description = "instance1 Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "output from instance1"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}