resource "aws_instance" "instance" {
  for_each = var.components

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = [var.security_group_id]

  tags = merge(
    {
      Name = each.value.name
    },
    var.tags
  )
}

# Create a 300 GB EBS Volume for each instance
resource "aws_ebs_volume" "volume" {
  for_each = var.components

  availability_zone = aws_instance.instance[each.key].availability_zone
  size              = 300
  type              = "gp3"
  encrypted         = true

  tags = merge(
    {
      Name = "${each.value.name}-volume"
    },
    var.tags
  )
}

# Attach the EBS Volume to each instance
resource "aws_volume_attachment" "attachment" {
  for_each = var.components

  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.volume[each.key].id
  instance_id = aws_instance.instance[each.key].id
}