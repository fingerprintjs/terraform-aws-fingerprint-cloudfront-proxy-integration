variable "fpjs_get_result_path" {
  type        = string
  description = "request path used to send identification requests (aka FPJS_GET_RESULT_PATH)"

  validation {
    condition     = can(regex("^([a-zA-Z0-9\\-])+$", var.fpjs_get_result_path))
    error_message = "value should only consist of alphanumeric values and dashes"
  }
}

variable "fpjs_agent_download_path" {
  type        = string
  description = "request path used to send ProCDN requests (aka FPJS_AGENT_DOWNLOAD_PATH)"

  validation {
    condition     = can(regex("^([a-zA-Z0-9\\-])+$", var.fpjs_agent_download_path))
    error_message = "value should only consist of alphanumeric values and dashes"
  }
}

variable "fpjs_shared_secret" {
  type        = string
  sensitive   = true
  description = "shared secret created on the Fingerprint dashboard (aka FPJS_PRE_SHARED_SECRET)"

  validation {
    condition     = can(regex("^([a-zA-Z0-9\\-])+$", var.fpjs_shared_secret))
    error_message = "value should only consist of alphanumeric values and dashes"
  }
}

variable "fpjs_proxy_lambda_role_permissions_boundary_arn" {
  type        = string
  description = "permissions boundary ARN for the role assumed by the Proxy lambda"
  default     = null
  validation {
    condition = anytrue([
      var.fpjs_proxy_lambda_role_permissions_boundary_arn == null,
      can(regex("^arn:aws:iam::[[:digit:]]+:policy/.+", var.fpjs_proxy_lambda_role_permissions_boundary_arn)),
    ])
    error_message = "value must be a valid policy ARN or null"
  }
}
