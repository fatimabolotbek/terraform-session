variable "region" {
  type        = string
  description = "us-west-1"
  default     = "usw1"
}
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
variable "team" {
  type        = string
  description = "Team Name"
  default     = "cloud"
}
variable "owner" {
  type        = string
  description = "owner of the resource"
  default     = "fatima"

}
variable "managed_by" {
  type        = string
  description = "managed by"
  default     = "terraform"

}
variable "project" {
  type        = string
  description = "project name"
  default     = "jerry"

}