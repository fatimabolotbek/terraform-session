resource "aws_default_vpc" "main" {
  tags = merge(
    { Name = replace(local.name, "rtype", "vpc") },
    local.common_tags
  )
}
resource "aws_default_subnet" "public_subnet_1" {
  availability_zone = "us-west-1a"
  tags = merge(
    { Name = replace(local.name, "rtype", "public-subnet-1") },
    local.common_tags
  )

}
resource "aws_default_subnet" "public_subnet_2" {
  availability_zone = "us-west-1c"
  tags = merge(
    { Name = replace(local.name, "rtype", "public-subnet-2") },
    local.common_tags
  )

}





#How to turn multiple maps into a single map?
#Merge function: merges multiple tags 