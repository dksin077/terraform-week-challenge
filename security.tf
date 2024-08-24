# create key pair for login
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/id_rsa.pub")
}

# create security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "allow_tls"
  }
  dynamic "ingress" {
    for_each = [ 22,443,80 ]
    iterator = port
    content {
    from_port = port.value
    to_port = port.value
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "tcp"
    } 
  }
  dynamic "egress" {
    for_each = [0]
    iterator = port
    content {  
    from_port        = port.value
    to_port          = port.value
    protocol         = "-1"  # all ports
    cidr_blocks      = ["0.0.0.0/0"]  #anywhere
    }
    
  }
}
