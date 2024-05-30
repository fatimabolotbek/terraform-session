resource "aws_instance" "web" {
  count = 3
  ami           = "ami-0cbe318e714fc9a82"     // Data 
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.web.id ]

  tags = {
    Name = "${var.env}-instance"    // half dynamic half harde coded // var.env-instance = dev-instance
    Enhancements = var.env
  }
}
// how to reference to Input Variable?
//Syntax: var.variable_name 

//Highlight + Command + d