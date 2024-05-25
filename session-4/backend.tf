terraform {
  backend "s3" {
    bucket = "terraforme-session-backend"
    key    = "session-4/terraform.tfstate"
    region = "us-west-1"
  }
}
