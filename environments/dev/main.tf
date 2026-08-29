module "splunk_security_group" {
  source                     = "../../modules/security-group"
  vpc_id                     = var.vpc_id
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
  cidr_ipv4                  = var.cidr_ipv4
  ip_protocol                = var.ip_protocol
  management_port            = var.management_port
  receiving_port             = var.receiving_port
  web_interface_port         = var.web_interface_port
  api_port                   = var.api_port
  ssh_port                   = var.ssh_port
}

module "splunk_iam" {
  source              = "../../modules/iam"
  role_name           = var.role_name
  profile_name        = var.profile_name
  managed_policy_arns = var.managed_policy_arns
  tags                = var.tags
}

module "splunk_ec2" {
  source               = "../../modules/ec2"
  components           = var.components
  security_group_id    = module.splunk_security_group.security_group_id
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = module.splunk_iam.instance_profile_name
  tags                 = var.tags
}

module "route53_dev" {
  source  = "../../modules/route53"
  zone_id = var.zone_id

  records = {
    "cluster-manager.dev.kiranpanchavati.online" = module.splunk_ec2.instance_public_ips["cluster_master"]
    "deployer.dev.kiranpanchavati.online"        = module.splunk_ec2.instance_public_ips["deployer"]
    "search-head1.dev.kiranpanchavati.online"    = module.splunk_ec2.instance_public_ips["search_head1"]
    "search-head2.dev.kiranpanchavati.online"    = module.splunk_ec2.instance_public_ips["search_head2"]
    "search-head3.dev.kiranpanchavati.online"    = module.splunk_ec2.instance_public_ips["search_head3"]
    "indexer1.dev.kiranpanchavati.online"        = module.splunk_ec2.instance_public_ips["indexer1"]
    "indexer2.dev.kiranpanchavati.online"        = module.splunk_ec2.instance_public_ips["indexer2"]
    "monitoring-console.dev.kiranpanchavati.online" = module.splunk_ec2.instance_public_ips["monitoring_console"]
    "license-master.dev.kiranpanchavati.online"    = module.splunk_ec2.instance_public_ips["license_master"]
    "deployment-server.dev.kiranpanchavati.online"  = module.splunk_ec2.instance_public_ips["deployment_server"]
    "heavyforwarder.dev.kiranpanchavati.online"    = module.splunk_ec2.instance_public_ips["heavyforwarder"]
  }
}
