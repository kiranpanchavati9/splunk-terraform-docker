#############################################
# Security Group Variables
#############################################

variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group."
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group."
  type        = string
}

#############################################
# Network Variables
#############################################

variable "cidr_ipv4" {
  description = "IPv4 CIDR block allowed to access the security group."
  type        = string
}

variable "ip_protocol" {
  description = "IP protocol for security group rules (e.g. tcp, udp, -1)."
  type        = string
  default     = "tcp"
}

#############################################
# Splunk Ports
#############################################

variable "management_port" {
  description = "Splunk Management Port (Default: 8089)"
  type        = number
  default     = 8089
}

variable "receiving_port" {
  description = "Splunk Receiving Port for Universal/Heavy Forwarders (Default: 9997)"
  type        = number
  default     = 9997
}

variable "web_interface_port" {
  description = "Splunk Web Interface Port (Default: 8000)"
  type        = number
  default     = 8000
}

variable "api_port" {
  description = "HTTPS API Port (Default: 443)"
  type        = number
  default     = 443
}


#############################################
# IAM Variables
#############################################

variable "role_name" {
  description = "Name of the IAM Role"
  type        = string
}

variable "profile_name" {
  description = "Name of the IAM Instance Profile"
  type        = string
}

variable "tags" {
  description = "Tags for the IAM Role and Instance Profile"
  type        = map(string)
  default     = {}
}


variable "managed_policy_arns" {
  description = "List of AWS Managed Policy ARNs"
  type        = list(string)
  default     = []
}



#############################################
# EC2 Variables
#############################################

variable "components" {
  description = "Map of Splunk components to create EC2 instances for"
  type = map(object({
    name      = string
    user_data = string
  }))
}

variable "ami" {
  description = "AMI to use for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key name to use for the EC2 instances"
  type        = string
}

variable "ssh_port" {
  description = "SSH Port (Default: 22)"
  type        = number
}

variable "zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}
