variable "env" {
    type = string
    description = "this variable is for enviroment"
    default = "dev" //Default Value

}
variable "ports" {
    type = list(number)
    description = "this variable is for ports" // description"
    default = [ 22, 3306, 443, 80 ]   // default value
  
}