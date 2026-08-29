#############################################
# EC2 Outputs
#############################################

output "instance_ids" {
  description = "EC2 Instance IDs"

  value = {
    for name, instance in aws_instance.instance :
    name => instance.id
  }
}

output "instance_arns" {
  description = "EC2 Instance ARNs"

  value = {
    for name, instance in aws_instance.instance :
    name => instance.arn
  }
}

output "instance_public_ips" {
  description = "Public IP Addresses"

  value = {
    for name, instance in aws_instance.instance :
    name => instance.public_ip
  }
}

output "instance_private_ips" {
  description = "Private IP Addresses"

  value = {
    for name, instance in aws_instance.instance :
    name => instance.private_ip
  }
}

output "instance_names" {
  description = "EC2 Instance Names"

  value = keys(aws_instance.instance)
}
