terraform {
  backend "s3" {
    bucket = "terraforme-session-backend"
    key    = "project/dev/terraform.tfstate"
    region = "us-west-1"
  }
}