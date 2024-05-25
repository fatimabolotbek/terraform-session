variable "env" {
    type = string
    description = "this is for environments"
    default = "dev"
  
}

variable "ami" {
    type =  string
    description = "Amazon Machine Image"
    default = "ami-0cbe318e714fc9a82"
  
}
variable "instance_type" {
    type = string
    description = "instence size"
    default     = "t2.micro"
  
}

variable "sg" {
    type = list(string)
    description = "Security group id "
    default = [ "" ]
  
}