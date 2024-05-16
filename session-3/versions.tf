terraform {
   required_version = "~>1.8.3"   // Terraforme version 
   required_providers {    // Provider Version 
     aws = {
        source = "hashicorp/aws"  
        version = "~>5.49.0"
     }
   }
}




// 1.5.7 = Symentic Versioning 
// 1 = Major (Upgrade)= MAIN CHANGES 
// 5 = Minor (UBDATE) = Features/ Enhancements
// 7 = Pach (Patching) = Fix Vulnerabilities



