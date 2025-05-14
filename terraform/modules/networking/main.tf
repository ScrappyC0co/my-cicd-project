resource "aws_vpc" "main" {   # The VPC is like a virtual network inside AWS.
  cidr_block = var.vpc_cidr   # This creates a Virtual Private Cloud (VPC).
}                             # cidr_block = var.vpc_cidr means we get the IP range from a variable (e.g. "10.0.0.0/16").


resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main.id      # Creates a subnet in the VPC (like a smaller chunk of the network).
  cidr_block = "10.0.1.0/24"        # This subnet is public because we'll attach an Internet Gateway to the VPC later.
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true    # map_public_ip_on_launch = true gives EC2 instances public IPs, so they can access the internet.

}

resource "aws_internet_gateway" "igw" {  # This creates an Internet Gateway (IGW).
  vpc_id = aws_vpc.main.id               # The IGW is what lets resources in the VPC access the internet.
}                                        # You need this for public access, like SSH or downloading packages.


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id             #  A route table for internet-bound traffic

  route {
    cidr_block = "0.0.0.0/0"                 #  Means all traffic
    gateway_id = aws_internet_gateway.igw.id # Sends it to the Internet Gateway
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_a.id                # This attaches the route table to the public subnet
  route_table_id = aws_route_table.public.id             # Now anything in this subnet can reach the internet 
}







