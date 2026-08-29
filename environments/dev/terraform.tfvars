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
    user_data = "../../cloud-init/indexer.yml"
  }
  indexer2 = {
    name = "splunk-dev-indexer2"
    user_data = "../../cloud-init/indexer.yml"
  }
  search_head1 = {
    name = "splunk-dev-search-head-1"
    user_data = "../../cloud-init/search-head.yml"
  }
  search_head2 = {
    name = "splunk-dev-search-head-2"
    user_data = "../../cloud-init/search-head.yml"
  }
  search_head3 = {
    name = "splunk-dev-search-head-3"
    user_data = "../../cloud-init/search-head.yml"
  }
  monitoring_console = {
    name = "splunk-dev-monitoring-console"
    user_data = "../../cloud-init/splunk-monitoringconsole.yml"
  }
  deployer = {
    name = "splunk-dev-deployer"
    user_data = "../../cloud-init/splunk-deployer.yml"
  }
  license_master = {
    name = "splunk-dev-license-master"
    user_data = "../../cloud-init/splunk-license-master.yml"
  }

  deployment_server = {
    name = "splunk-dev-deployment-server"
    user_data = "../../cloud-init/splunk-deployment-server.yml"
  }
  heavyforwarder = {
    name = "splunk-dev-heavyforwarder"
    user_data = "../../cloud-init/splunk-hf.yml"
  }
  cluster_master = {
    name = "splunk-dev-cluster-master"
    user_data = "../../cloud-init/splunk-cluster-master.yml"
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

ami = "ami-00adafae70b8029d8"
instance_type = "t3.small"
key_name = "aws-helpag"
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