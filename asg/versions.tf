terraform {
   required_version = "~>1.8.3"   // Terraforme version 
   required_providers {    // Provider Version 
     aws = {
        source = "hashicorp/aws"  
        version = "~>5.49.0"
     }
   }
}