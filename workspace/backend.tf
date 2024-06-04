terraform {
  backend "s3" {
    bucket = "terraforme-session-backend"
    key    = "terraform.tfstate"
    region = "us-west-1"
    workspace_key_prefix = "workspaces"
  }
}


// currently : defolt 
// beckend File Path : worckspaces/terraforme.tfstate
// new: dev
// Backend File Path : worckspaces/dev/terraforme.tfstate