# Security Group for Splunk

resource "aws_security_group" "this" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  tags = merge(
    {
      Name = var.security_group_name
    },
    var.tags
  )
}

# Allow Splunk API Traffic (Inbound)

resource "aws_vpc_security_group_ingress_rule" "api" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.api_port
  to_port           = var.api_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-api-ingress"
  }
}

# Allow Splunk Management Traffic (Inbound)

resource "aws_vpc_security_group_ingress_rule" "management" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.management_port
  to_port           = var.management_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-management-ingress"
  }
}

# Allow Splunk Receiving Traffic (Inbound)

resource "aws_vpc_security_group_ingress_rule" "receiving" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.receiving_port
  to_port           = var.receiving_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-receiving-ingress"
  }
}

# Allow Splunk Web Interface Traffic (Inbound)

resource "aws_vpc_security_group_ingress_rule" "web" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.web_interface_port
  to_port           = var.web_interface_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-web-ingress"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-ssh-ingress"
  }
}



# Allow Splunk API Traffic (Outbound)

resource "aws_vpc_security_group_egress_rule" "api" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.api_port
  to_port           = var.api_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-api-egress"
  }
}

# Allow Splunk Management Traffic (Outbound)

resource "aws_vpc_security_group_egress_rule" "management" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.management_port
  to_port           = var.management_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-management-egress"
  }
}

# Allow Splunk Receiving Traffic (Outbound)

resource "aws_vpc_security_group_egress_rule" "receiving" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.receiving_port
  to_port           = var.receiving_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-receiving-egress"
  }
}

# Allow Splunk Web Interface Traffic (Outbound)

resource "aws_vpc_security_group_egress_rule" "web" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.web_interface_port
  to_port           = var.web_interface_port
  ip_protocol       = var.ip_protocol
  tags = {
    Name = "splunk-web-egress"
  }
}