variable "env" {
  type        = string
  description = "Enviroment"
  default     = "dev"
}
variable "tier" {
  type        = string
  description = "Aplication tire"
  default     = "beckend"

}
variable "project" {
  type        = string
  description = "project name"
  default     = "jerry"

}
variable "team" {
  type        = string
  description = "Team Name"
  default     = "cloud"
}
variable "application" {
  type        = string
  description = "Application"
  default     = "dora"
}

################ sec grup#######
variable "ec2_ports" {
  type = list(object({
    port     = number
    protocol = string
    }
  ))
  default = [
    {
      port     = 80
      protocol = "tcp"
    },
    {
      port     = 22
      protocol = "tcp"
    }
  ]
}
#########

variable "alb_ports" {
  type = list(object({
    port     = number
    protocol = string
    }
  ))
  default = [
    {
      port     = 80
      protocol = "tcp"
    },
    {
      port     = 443
      protocol = "tcp"
    }
  ]
}
####### Lunuch templete
variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.micro"

}

variable "zone_id" {
  type = string
  description = "Rout53 Zone Id"
  default = "Z0438803V2R3XWGHS6VM"
  
}

