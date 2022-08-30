variable "region" {
  type        = string
  description = "AWS region"
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`, `infra`)"
}

variable "es_namespace" {
  type        = string
  description = "Namespace for ES (e.g. `pes`)"
  default     = "pes"
}

variable "component" {
  type        = string
  description = "Component (e.g. `reporting`)"
}

variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}

variable "instance_type" {
  type        = string
  description = "The type of the instance"
}

variable "elasticsearch_version" {
  type        = string
  description = "Version of Elasticsearch to deploy"
}

variable "instance_count" {
  type        = number
  description = "Number of data nodes in the cluster"
}

variable "zone_awareness_enabled" {
  type        = bool
  description = "Enable zone awareness for Elasticsearch cluster"
}

variable "encrypt_at_rest_enabled" {
  type        = bool
  description = "Whether to enable encryption at rest"
}

variable "encrypt_at_rest_kms_key_id" {
  type        = string
  default     = ""
  description = "The KMS key ID to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key"
}

variable "log_publishing_application_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether log publishing option for ES_APPLICATION_LOGS is enabled or not"
}

variable "log_publishing_audit_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether log publishing option for AUDIT_LOGS is enabled or not"
}

variable "log_publishing_application_cloudwatch_log_group_arn" {
  type        = string
  default     = ""
  description = "ARN of the CloudWatch log group to which log for ES_APPLICATION_LOGS needs to be published"
}

variable "dedicated_master_enabled" {
  type        = bool
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
}


variable "dedicated_master_count" {
  type        = number
  description = "Number of dedicated master nodes in the cluster"
  default     = 0
}

variable "dedicated_master_type" {
  type        = string
  default     = ""
  description = "Instance type of the dedicated master nodes in the cluster"
}

variable "es_subdomain_name" {
  type        = string
  description = "The name of the subdomain for ES in the DNS zone (_e.g._ `elasticsearch`, `reporting.elasticsearch`)"
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volumes for data storage in GB"
}

variable "ebs_volume_type" {
  type        = string
  default     = "gp2"
  description = "Storage type of EBS volumes"
}

variable "ebs_iops" {
  type        = number
  default     = 0
  description = "The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type"
}

variable "dns_zone_id" {
  type        = string
  default     = null
  description = "Route53 DNS Zone ID to add hostname records for Elasticsearch domain and Kibana"
}

variable "availability_zone_count" {
  type        = number
  default     = 2
  description = "Number of Availability Zones for the domain to use."
}

variable "cognito_enabled" {
  type        = bool
  default     = false
  description = "whether to enable cognito authentication"
}

variable "cognito_identity_pool_id" {
  type        = string
  description = "cognito identity pool id, the IDP to use"
  default = ""
}

variable "cognito_role_arn" {
  type        = string
  description = "AWS role ARN, role to access cognito from Elasticsearch"
  default = ""
}

variable "cognito_user_pool_id" {
  type        = string
  description = "the cognito user pool that will have access to login to kibana"
  default = ""
}

variable "iam_actions" {
  type        = list(string)
  default     = []
  description = "List of actions to allow for the IAM roles, _e.g._ `es:ESHttpGet`, `es:ESHttpPut`, `es:ESHttpPost`"
}

variable "iam_role_arns" {
  type        = list(string)
  default     = []
  description = "List of IAM role ARNs to permit access to the Elasticsearch domain"
}

variable "security_groups" {
  type        = list(string)
  default     = []
  description = "List of security group IDs to be allowed to connect to the cluster"
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "List of CIDR blocks to be allowed to connect to the cluster"
}

variable "advanced_options" {
  type        = map(string)
  default     = {}
  description = "Key-value string pairs to specify advanced configuration options"
}

variable "enable_advanced_security_options" {
  type        = bool
  description = "(Forces new resource) Whether advanced security is enabled"
  default     = false
}

variable "enable_internal_user_database" {
  type        = bool
  description = "Whether the internal user database is enabled"
  default     = false
}

variable "master_user_arn" {
  type        = string
  description = "ARN for the master user. Only specify if internal_user_database_enabled is not set or set to false"
  default     = ""
}

variable "master_user_name" {
  type        = string
  description = "The master user's username, which is stored in the Amazon Elasticsearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true"
  default     = ""
}

variable "master_user_password" {
  type        = string
  description = "The master user's password, which is stored in the Amazon Elasticsearch Service domain's internal database. Only specify if internal_user_database_enabled is set to true"
  default     = ""
}

variable "node_to_node_encryption_enabled" {
  type        = bool
  default     = false
  description = "Whether to enable node-to-node encryption"
}


variable "enforce_https" {
  type        = bool
  description = "Whether or not to require HTTPS"
  default     = true
}

variable "tls_security_policy" {
  type        = string
  description = "The name of the TLS secuirty policy that needs to be applied to the HTTPS endpoint. Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07"
  default     = "Policy-Min-TLS-1-2-2019-07"
}

variable "vault_name" {
  type        = string
  description = "Vault variable that has the username/password credentials"
  default = "os-master"
}

variable "custom_endpoint_certificate_arn" {
  type        = string
  description = "The name of the Custom endpoint certificate arn"
  default = ""
}
 
variable "custom_endpoint_enabled" {
  type        = bool
  default     = false
  description = "Boolean value of custom endpoint and default is false"
}
 
variable "custom_endpoint" {
  type        = string
  description = "The name of the Custom endpoint"
  default = ""
}

variable "warm_enabled" {
  type        = bool
  description = "Whether to enable warm storage."
  default     = false
}

variable "warm_count" {
  type        = number
  description = "Number of warm nodes in the cluster. Valid values are between 2 and 150"
  default     = 2
}

variable "warm_type" {
  type        = string
  description = "Valid values are ultrawarm1.medium.elasticsearch, ultrawarm1.large.elasticsearch and ultrawarm1.xlarge.elasticsearch. warm_type"
  default     = ""
}
