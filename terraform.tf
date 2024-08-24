# create public instance 
resource "aws_instance" "my_instance" {
  ami = var.image_id
  instance_type = var.instance_type
  availability_zone =  "ap-south-1a"
  associate_public_ip_address = true
  tags = {
    "key" = "first-instance" 
  }
    key_name = "${aws_key_pair.deployer.key_name}"
    vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
    subnet_id = "${aws_subnet.public_subnet.id}"
}


