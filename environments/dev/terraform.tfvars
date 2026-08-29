vpc_id = "vpc-0fcbf944165ec4597"
cidr_ipv4 = "0.0.0.0/0"
security_group_name = "splunk-dev-sg"
security_group_description = "Splunk Development Security Group" 
ip_protocol = "tcp"
management_port = 8089
receiving_port = 9997
web_interface_port = 8000
ssh_port = 22
api_port = 443
role_name = "splunk-dev-role"
profile_name = "splunk-dev-profile"

components = {
  indexer1 = {
    name = "splunk-dev-indexer1"
  }
  indexer2 = {
    name = "splunk-dev-indexer2"
  }
  search_head1 = {
    name = "splunk-dev-search-head-1"
  }
  search_head2 = {
    name = "splunk-dev-search-head-2"
  }
  search_head3 = {
    name = "splunk-dev-search-head-3"
  }
  monitoring_console = {
    name = "splunk-dev-monitoring-console"
  }
  deployer = {
    name = "splunk-dev-deployer"
  }
  license_master = {
    name = "splunk-dev-license-master"
  }

  deployment_server = {
    name = "splunk-dev-deployment-server"
  }
  heavyforwarder = {
    name = "splunk-dev-heavyforwarder"
  }
  cluster_master = {
    name = "splunk-dev-cluster-master"
  }
}

# component_names = [
#   "splunk-dev-license-master",
#   "splunk-dev-universalforwarder",
#   "splunk-dev-deployment-server",
#   "splunk-dev-heavyforwarder",
#   "splunk-dev-cluster-master",
#   "splunk-dev-indexer1",
#   "splunk-dev-indexer2",
#   "splunk-dev-search-head-1",
#   "splunk-dev-search-head-2",
#   "splunk-dev-search-head-3",
#   "splunk-dev-monitoring-console",
#   "splunk-dev-deployer"
# ]

ami = "ami-0220d79f3f480ecf5"
instance_type = "t3.small"
managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
tags = {
  Environment = "Development"
  Project     = "Splunk"
  Team        = "DevOps"
  CreatedBy   = "Terraform"
  CreatedAt   = "2026-07-18"
  UpdatedAt   = "2026-07-18"
}
zone_id = "Z01214421PKKTLXAI5VN5"