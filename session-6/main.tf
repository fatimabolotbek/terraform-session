module "ec2" {
  source        = "github.com/fatimabolotbek/terraform-session//modules/ec2?ref=v1.0.0"
  env           = "dev"
  ami           = "ami-0cbe318e714fc9a82"
  instance_type = "t2.micro"
  sg            = [module.sg.security_group_id]

}
module "sg" {
  source = "github.com/fatimabolotbek/terraform-session//modules/sg?ref=v1.0.0"
  env   = "dev"
  ports = ["22", "3306", "443", "80"]

}