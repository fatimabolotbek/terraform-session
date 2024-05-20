variable "public_subnet_cidrs" {                 //This line declares a variable named
  type        = list(string)                     //variable  strings, meaning it can hold multiple strings as values.
  description = "Public subnet cidrs values"     //CIDR (Classless Inter-Domain Routing) values for public subnets.
  default     = ["10.0.1.0/24", "10.0.3.0/24", ] //list containing three CIDR strings representing IP address ranges for public subnets
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet cidrs values"
  default     = ["10.0.11.0/24", "10.0.13.0/24", ]
}

variable "az" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-west-1a", "us-west-1c"] //listing three strings representing different availability zones, possibly in the region 
}