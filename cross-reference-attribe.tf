provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "lb" {
    domain   = "vpc"
}

resource "aws_security_group" "ex-sec-grp" {
  name = "attribute-sg"
}

resource "aws_vpc_security_group_ingress_rule" "ex-ing" {
    security_group_id = aws_security_group.ex-sec-grp.id
    cidr_ipv4         = "${aws_eip.lb.public_ip}/32"
    from_port = 443
    ip_protocol = "tcp"
    to_port = 443
}