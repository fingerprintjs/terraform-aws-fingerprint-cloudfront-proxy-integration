variable "fpjs_shared_secret" {
  // https://dev.fingerprint.com/docs/cloudfront-proxy-integration-v2#step-1-issue-a-proxy-secret
  description = "The proxy secret for the Fingerprint proxy integration"
  type        = string
}

variable "fpjs_agent_download_path" {
  // https://dev.fingerprint.com/docs/cloudfront-proxy-integration-v2#step-2-create-path-variables
  description = "The Fingerprint agent download will be proxied through this path"
  type        = string
}

variable "fpjs_get_result_path" {
  // https://dev.fingerprint.com/docs/cloudfront-proxy-integration-v2#step-2-create-path-variables
  description = "The Fingerprint identification request will be proxied through this path"
  type        = string
}

/**
 * The following variables are only relevant for this example. 
 * - They are not relevant to the module itself
 * - They are optional, uncomment them out if you want to add a subdomain for the CloudFront distribution 
 */

# variable "proxy_subdomain_domain" {
#   description = "The subdomain for the CloudFront distribution, including the root domain of your website, for example `metrics.yourwebsite.com`"
#   type        = string
# }

# variable "domain_zone_id" {
#   description = "Zone ID of the domain for the CloudFront distribution"
#   type        = string
# }

# variable "certificate_arn" {
#   description = "ARN of the domain certificate for the CloudFront distribution"
#   type        = string
# }
