// Naming convention: NAMEING STANDAR
# provider name:  aws,azure,google
# Region : use1,usw1,use2
# Enviroment: dev ,qa ,stage, provider
# Projec name : batman 
# Application Tier: frontent ,beckend 
# Resource Type: ec2 ,s3 , alb, sg, required_version
# Example Type: provider_name-region-Enviroment-Projec_name-Application_tier-resource_type
# RDS Inctence :
# aws-use2-dev-db-rds               // it is all  names 
# S3 bucket:
# aws-use2-dev-tom-backend-s3
# EC2: 
# aws-use2-dev-tom-frontent-ec2


# // Teging Standard : common Tage
# Enviroment: dev ,qa ,stage, provider
# Projec name : batman 
# Application Tier: frontent ,beckend 
# Team: cloud,devops,devolopment
# Owner : Fatima
# Managed_by = cloudformation ,terraform, python, manual

locals {
  name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-rtype"
  common_tags = {
    Environment = var.env
    Project     = var.project
    Tier        = var.team
    Owner       = var.owner
    Managed_By  = var.managed_by
    Tier        = var.tier
  }
}