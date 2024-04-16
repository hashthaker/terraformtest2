#Create VPC
resource "aws_vpc" "example_vpc" {
    cidr_block = "10.0.0.0/16"
}

#Create a subnet within the above VPC
resource "aws_subnet" "example_subnet" {
    vpc_id = aws_vpc.example_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "eu-west-2a"
}

#Create a SG for EC2 instane in above VPC
resource "aws_security_group" "example-sg" {
    vpc_id = aws_vpc.example_vpc.id
    name = "example-sg"
    description = "Allow SSH and HTTP traffic"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}