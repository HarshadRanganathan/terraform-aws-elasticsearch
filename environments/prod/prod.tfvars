stage = "prod"

component = "os"

elasticsearch_version = "OpenSearch_1.1"

allowed_cidr_blocks = ["10.1.0.0/16"]

es_namespace = "aws"

# full name no more than 28 characters long
# <namespace>-<stage> is prefixed to this name
name = "os"

es_subdomain_name = "test.opensearch"

dedicated_master_type  = "r5.xlarge.elasticsearch"

instance_type = "r5.2xlarge.elasticsearch"

advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
    "override_main_response_version"         = "true"
}

log_publishing_audit_enabled = "true"
node_to_node_encryption_enabled = "true"
enable_internal_user_database = "true"
enable_advanced_security_options = "true"
enforce_https = "true"

vault_name = "os-master"