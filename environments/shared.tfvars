region = "us-east-1"

namespace = "aws"

es_namespace = "aws"

# full name no more than 28 characters long
# <namespace>-<stage> is prefixed to this name
name = "elasticsearch"


# availability zones
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

availability_zone_count = 3


# master and instance details
dedicated_master_enabled = true

dedicated_master_count = 3

dedicated_master_type  = "r5.xlarge.elasticsearch"

instance_type = "r5.2xlarge.elasticsearch"

instance_count = 4

zone_awareness_enabled = true



log_publishing_application_enabled = true

ebs_volume_size = 250


# cognito
cognito_enabled = false


# iam
iam_actions = ["es:*"]

iam_role_arns = ["*"]


# encryption
encrypt_at_rest_enabled = true

enforce_https = false

tls_security_policy = "Policy-Min-TLS-1-2-2019-07"


advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
}
