data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]
  }
  // Semantic Versioning 
  // Major.Min  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}