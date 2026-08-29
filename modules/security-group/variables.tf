#############################################
# Security Group Variables
#############################################

variable "security_group_name" {
  description = "Name of the security group."
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security group will be created."
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
}

#############################################
# Splunk Ports
#############################################

variable "management_port" {
  description = "Splunk Management Port (Default: 8089)"
  type        = number
}

variable "receiving_port" {
  description = "Splunk Receiving Port for Universal/Heavy Forwarders (Default: 9997)"
  type        = number
}

variable "web_interface_port" {
  description = "Splunk Web Interface Port (Default: 8000)"
  type        = number
}


variable "ssh_port" {
  description = "SSH Port (Default: 22)"
  type        = number
}

variable "api_port" {
  description = "HTTPS API Port (Default: 443)"
  type        = number
}

#############################################
# Tags
#############################################

variable "tags" {
  description = "Additional tags to apply to the security group."
  type        = map(string)
  default     = {}
}