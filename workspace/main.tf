resource "aws_sqs_queue" "main" {
  name = "${terraform.workspace}-sqs"
}


// how to refferance to worckspace ? 
//Synax: 