resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound and outbound traffic (dev only)"  # This creates a security group (AWS firewall)
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0                #  allows all inbound traffic from anywhere (for testing only!)
    protocol    = "-1"             #  means “any protocol”
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0                # allows all outbound traffic (so EC2 can reach internet)
    protocol    = "-1"             #  means “any protocol”
    cidr_blocks = ["0.0.0.0/0"]
  }
}
