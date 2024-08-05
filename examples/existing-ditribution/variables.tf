variable "fpjs_shared_secret" {
  description = "The proxy secret for the Fingerprint proxy integration"
  type        = string
}

variable "fpjs_behavior_path" {
  description = "All Fingeprint requests will be proxied through this path segment"
  type        = string
}

variable "fpjs_agent_download_path" {
  description = "The Fingerprint agent download will be proxied through this path segment"
  type        = string
}

variable "fpjs_get_result_path" {
  description = "The Fingerprint identification request will be proxied through this path segment"
  type        = string
}

variable "website_domain" {
  description = "The domain for your existing CloudFront distribution, like `yourwebsite.com`"
  type        = string
}

variable "website_origin_domain_name" {
  description = "The main origin of your distribution pointing to your website, like `yourwebsite.s3.amazonaws.com`"
  type        = string
}

variable "domain_zone_id" {
  description = "Zone ID of the domain for your existing CloudFront distribution"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the domain certificate for your website"
  type        = string
}


