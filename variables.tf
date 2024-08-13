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
  description = "request path used to send agent download requests (aka FPJS_AGENT_DOWNLOAD_PATH)"

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
  description = "Permissions boundary ARN for the role assumed by the Proxy lambda. Make sure your permissions boundary allows the function to access the Secrets Manager secret created for the integration (`secretsmanager:GetSecretValue`) and create logs (`logs:CreateLogStream`, `logs:CreateLogGroup`, `logs:PutLogEvents`)."
  default     = null
}
