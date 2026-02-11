# EC2 Instance
# Launches an EC2 instance for WordPress and sets up user data.

# AMI Data Source
data "aws_ami" "amazon_linux_2023" {
  most_recent = true    # Get the latest version of the AMI
  owners      = ["amazon"]  # Only accept Amazon-owned AMIs

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]  # Filter for Amazon Linux 2023 AMIs
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]  # Hardware Virtual Machine AMIs only
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]  # EBS-backed instances only
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]  # 64-bit x86 architecture only
  }
}

# WordPress EC2 Instance
resource "aws_instance" "wordpress_ec2" {
  ami                    = data.aws_ami.amazon_linux_2023.id  # Use the AMI we filtered above
  instance_type          = var.instance_type  # Free tier eligible instance type
  subnet_id              = var.subnet_id  # Place in the public subnet
  vpc_security_group_ids = var.vpc_security_group_ids # Attach the EC2 security group
  key_name               = var.key_name  # Replace with your SSH key pair name

  # TODO: Pass in the 4 variables to the user data script
  user_data = var.user_data

  tags = {
    Name = "WordPress EC2 Instance"
  }
}