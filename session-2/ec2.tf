

resource "aws_instance" "web" {
  ami           = "ami-0cbe318e714fc9a82"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-session-instance"
  }
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