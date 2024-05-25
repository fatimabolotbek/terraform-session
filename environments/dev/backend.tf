terraform {
  backend "s3" {
    bucket = "terraforme-session-backend"
    key    = "dev/terraform.tfstate"
    region = "us-west-1"
  }
}