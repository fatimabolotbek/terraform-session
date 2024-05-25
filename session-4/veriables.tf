variable "env" {
  type        = string
  description = "this variable is for enviroment"
  default     = "dev" //Default Value

}
variable "ports" {
  type        = list(number)
  description = "this variable is for ports" // description"
  default     = [22, 3306, 443, 80]          // default value

}

variable "instance_type" {
  type        = string
  description = "this variable is for instence typ" // description"
  default     = "t2.micro"                          // default value

}