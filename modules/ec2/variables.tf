variable "components" {
  description = "Splunk components"
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

variable "iam_instance_profile" {
  description = "IAM instance profile to use for the EC2 instances"
  type        = string
}

variable "tags" {
  description = "Tags for the EC2 instances"
  type        = map(string)
  default     = {}
}

variable "security_group_id" {
  description = "Security group ID to use for the EC2 instances"
  type        = string
}
