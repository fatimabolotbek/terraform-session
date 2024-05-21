terraform {
   backend "s3" {
     bucket = "terraforme-session-backend"
     key = "vpc/terraform.tfstate"
     region = "us-west-1"
   }
}


