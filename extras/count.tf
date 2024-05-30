resource "aws_sqs_queue" "count_queue" {
  count = 3
  name = element( var.names, count.index )
}

variable "names" {
    type = list(string)
    description = "a list of sqs queue names"
    default = [ "first", "second", "third" ]
  
}