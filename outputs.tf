output "public_subnet_cidrs" {
  value       = data.terraform_remote_state.vpc.outputs.public_subnets
  description = "Public subnet CIDRs"
}

output "private_subnet_cidrs" {
  value       = data.terraform_remote_state.vpc.outputs.private_subnets
  description = "Private subnet CIDRs"
}

/*
output "vpc_cidr" {
  value       = data.terraform_remote_state.vpc.outputs.vpc_cidr_bloc
  description = "VPC CIDR"
}
*/

# Test All Module Outputs
## cloudwatch_event
output "es_app_cloudwatch_group_arn" {
  description = "The Amazon Resource Name (ARN) of the rule."
  value       = module.es_app_cloudwatch_group.arn
}




output "domain_arn" {
  value       = module.elasticsearch.domain_arn
  description = "ARN of the Elasticsearch domain"
}

output "domain_id" {
  value       = module.elasticsearch.domain_id
  description = "Unique identifier for the Elasticsearch domain"
}

output "domain_endpoint" {
  value       = module.elasticsearch.domain_endpoint
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
}

output "domain_hostname" {
  value       = module.elasticsearch.domain_hostname
  description = "Elasticsearch domain hostname to submit index, search, and data upload requests"
}
