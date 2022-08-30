############
# Elasticsearch
############

module "elasticsearch" {
  source    = "git::https://github.com/HarshadRanganathan/terraform-aws-module-elasticsearch.git//module?ref=2.1.3"
  namespace = var.es_namespace
  stage     = var.stage
  name      = var.name

  # vpc configuration
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids              = data.terraform_remote_state.vpc.outputs.private_subnets
  dns_zone_id             = data.terraform_remote_state.route53_zone.outputs.private_zone_id
  availability_zone_count = var.availability_zone_count
  allowed_cidr_blocks     = var.allowed_cidr_blocks

  # elasticsearch configuraiton
  elasticsearch_version = var.elasticsearch_version
  instance_type         = var.instance_type
  instance_count        = var.instance_count

  # Domain endpoint options
  enforce_https       = var.enforce_https
  tls_security_policy = var.tls_security_policy
  custom_endpoint_enabled = var.custom_endpoint_enabled
  custom_endpoint = var.custom_endpoint
  custom_endpoint_certificate_arn = var.custom_endpoint_certificate_arn

  # ebs options
  ebs_volume_size = var.ebs_volume_size
  ebs_volume_type = var.ebs_volume_type
  ebs_iops        = var.ebs_iops

  # encrypt at rest
  encrypt_at_rest_enabled    = var.encrypt_at_rest_enabled
  encrypt_at_rest_kms_key_id = data.terraform_remote_state.elasticsearch_kms.outputs.key_id

  # cluster configuration
  dedicated_master_enabled = var.dedicated_master_enabled
  dedicated_master_count   = var.dedicated_master_count
  dedicated_master_type    = var.dedicated_master_type

  es_subdomain_name              = var.es_subdomain_name

  warm_enabled = var.warm_enabled
  warm_count   = var.warm_enabled ? var.warm_count : null
  warm_type    = var.warm_enabled ? var.warm_type : null

  # Log publishing options
  log_publishing_application_enabled                  = var.log_publishing_application_enabled
  log_publishing_application_cloudwatch_log_group_arn = module.es_app_cloudwatch_group.arn

  # cognito configuration
  cognito_enabled          = var.cognito_enabled
  cognito_identity_pool_id = var.cognito_identity_pool_id
  cognito_role_arn         = var.cognito_role_arn
  cognito_user_pool_id     = var.cognito_user_pool_id

  # zone awareness configuration
  zone_awareness_enabled = var.zone_awareness_enabled

  # advanced options
  advanced_options = var.advanced_options

  # IAM policy
  iam_actions   = var.iam_actions
  iam_role_arns = var.iam_role_arns

  # advanced_security_options
  node_to_node_encryption_enabled = var.node_to_node_encryption_enabled
  enable_advanced_security_options = var.enable_advanced_security_options
  enable_internal_user_database = var.enable_internal_user_database
  master_user_name = data.vault_generic_secret.database.data["USERNAME"]
  master_user_password = data.vault_generic_secret.database.data["PASSWORD"]
  log_publishing_audit_enabled = var.log_publishing_audit_enabled

}


// Cloudwatch log group creation
module "es_app_cloudwatch_group" {

  source = "git::https://github.com/HarshadRanganathan/terraform-aws-module-cloudwatch.git//module/log-group?ref=1.1.0"

  enabled = true

  namespace    = var.es_namespace
  stage        = var.stage
  name         = var.name
  stream_names = ["cloudwatch-group-elasticsearch-app-stream"]

  # cloudwatch resource policy
  additional_policy       = false

  retention_in_days = 7

  kms_key_arn = data.terraform_remote_state.kms_loggroup.outputs.key_arn
}