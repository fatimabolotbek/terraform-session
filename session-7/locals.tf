locals {
  name = "aws-${var.team}-${var.project}-${var.application}-rtype-${var.env}"
  common_tags = {
    Environment = var.env
    Team        = var.team
    Application = var.team
    Projec      = var.project
    Owner       = "Fatima"
    Managed_By  = "Terraforme"

  }
  asg_tags = merge(
    { Name = replace(local.name, "rtype", "asg") },
    local.common_tags
  )
}