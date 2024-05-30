terraform {
  backend "s3" {
    bucket = "terraforme-session-backend"
    key    = "extras/terraform.tfstate"
    region = "us-west-1"
  }
}