data "aws_availability_zones" "available" {
}

######
# VPC
######
data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    region = var.region
    bucket = format("%s-%s-%s-terraform-state", var.namespace, var.stage, var.region)
    key    = format("%s/vpc/terraform.tfstate", var.stage)
  }
}



##############################
# KMS
#############################
data "terraform_remote_state" "elasticsearch_kms" {
  backend = "s3"

  config = {
    region = var.region
    bucket = format("%s-%s-%s-terraform-state", var.namespace, var.stage, var.region)
    key    = format("%s/kms/elasticsearch/%s/terraform.tfstate", var.stage, var.component)
  }
}

data "terraform_remote_state" "kms_loggroup" {
  backend = "s3"

  config = {
    region = var.region
    bucket = format("%s-%s-%s-terraform-state", var.namespace, var.stage, var.region)
    key    = format("%s/kms/elasticsearch/%s/cloudwatch-logs/terraform.tfstate", var.stage, var.component)
  }
}


##############################
# Route53
#############################
data "terraform_remote_state" "route53_zone" {
  backend = "s3"

  config = {
    region = var.region
    bucket = format("%s-%s-%s-terraform-state", var.namespace, var.stage, var.region)
    key    = format("%s/route53/zone/terraform.tfstate", var.stage)
  }
}


data "vault_generic_secret" "database" {
  path = "pdp-pes/aws/${var.stage}/opensearch/${var.vault_name}"
}