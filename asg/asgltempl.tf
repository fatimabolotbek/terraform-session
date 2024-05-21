resource "aws_launch_template" "asg_lt" {
  name_prefix   = "asg_lt"
  image_id      = "ami-0cbe318e714fc9a82"
  instance_type = "t2.micro"
}


resource "aws_autoscaling_group" "autoscaling_group_aws" {
  availability_zones = ["us-west-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.asg_lt.id
    
  }
}