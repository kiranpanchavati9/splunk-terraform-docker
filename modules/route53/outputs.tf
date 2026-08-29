output "dns_records" {
  description = "DNS Records"

  value = aws_route53_record.record
}