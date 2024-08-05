variable "fpjs_shared_secret" {
  description = "The proxy secret for the Fingerprint proxy integration"
  type        = string
}

variable "fpjs_agent_download_path" {
  description = "The Fingerprint agent download will be proxied through this path"
  type        = string
}

variable "fpjs_get_result_path" {
  description = "The Fingerprint identification request will be proxied through this path"
  type        = string
}

variable "subdomain" {
  description = "The subdomain for the CloudFront distribution"
  type        = string
  # default   = "metrics"
}

variable "root_domain" {
  description = "The root domain for the CloudFront distribution"
  type        = string
  # default     = "yourwebsite.com"
}

variable "domain_zone_id" {
  description = "Zone ID of the domain for the CloudFront distribution"
  type        = string
}
