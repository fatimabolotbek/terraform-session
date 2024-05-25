resource "aws_instance" "web" {
  ami           = var.ami     // Data 
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg

  tags = {
    Name = "${var.env}-instance"    // half dynamic half harde coded // var.env-instance = dev-instance
    Enhancements = var.env
  }
}