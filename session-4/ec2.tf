resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2023.image_id // Data 
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = data.template_file.userdata.rendered //get an output of the file teraforme we use file fun

  tags = {
    Name = "${var.env}-instance",
    #Name1 = frome("%s-instace", var.env)
    Enviroment = var.env
  }
}