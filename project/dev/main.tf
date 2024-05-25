module "ec2" {
  ############ Module Arguments ############
  source = "../../modules/ec2"   // Required Arguments ,where your specify the localtion of Childe Module
  ///version = ""  // Optional Arguments ,where your specify the  version of your Childe Modul 
  ############ Input Veriables that are reguired for the Childe Module ##########
  env = "dev"
  ami = "ami-0cbe318e714fc9a82"
  instance_type = "t2.micro"
  sg = [module.sg.security_group_id]

}
module "sg" {
  source = "../../modules/sg"

  env = "dev"
  ports = ["22", "3306", "443", "80"]
}

// how to Reference to Module? 
// sintex: module.module_name.output_value