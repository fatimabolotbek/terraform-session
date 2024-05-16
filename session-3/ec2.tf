resource "aws_instance" "web" {
  ami           = "ami-0cbe318e714fc9a82"     // Data 
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.web.id ]

  tags = {
    Name = "Terraform-session-instance"
  }
}


resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"
  

  tags = {
    Name = "web"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
// Each terafform configuration file

// There are 2 mane blocks  in terafform 
// 1. Resource Block = is desain to create and manage Resources (aws  services or Infastructure )
//  - Resource Block expects 2 labels
// 2. Data Source Block = ?





// syntex: 
// resource = block 
// aws_instence = first_label, (resource type ) ,predefined by Terreform 
// web = second_label , ( logical name or logical id )i hase 
// ami = is argument, (consists of key/value , Name/Value), configurations of the resource
// - Key  = is predefined by Terraforme 
// - Value = is defined by Author 

// Working Directory 
// - place where you run Terraform Commands 
// - Place where you have Terraforme Configurations Files 
// - (Root Module ) 

// Terraforme has Backend (terraforme .tfstate)
// -Local Backend = gets generated in the same working directory 
// -Remote Backend = gets generated in the remote working 
// how to referece to Ressurce?
// in order to Referance to Resource, we 