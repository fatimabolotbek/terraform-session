data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]
  }
// Semantic Versioning 
// Major.Min  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "template_file" "userdata" {
  template = file("userdata.sh")      //data sourceing 
  vars = {                           // argument 
    enviroment = var.env             // varible call var.env
  }
}

//Data source Block: Fetch the code frome Pre-exicting Resource 
// sintex: data "first_label" "second_label"