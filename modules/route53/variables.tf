variable "zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string
}

variable "records" {
  description = "DNS Records"

  type = map(string)
}