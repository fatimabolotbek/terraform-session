resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"
  

  tags = {
    Name = "web"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  count = length(var.ports)
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = element( var.ports, count.index)
  ip_protocol       = "tcp"
  to_port           = element( var.ports, count.index)
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