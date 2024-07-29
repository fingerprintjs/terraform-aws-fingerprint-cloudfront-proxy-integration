output "fpjs_cache_policy_id" {
  value       = aws_cloudfront_cache_policy.fpjs_procdn.id
  description = "Fingerprint integration cache policy id"
}

output "fpjs_proxy_lambda_arn" {
  value       = aws_lambda_function.fpjs_proxy_lambda.qualified_arn
  description = "Fingerprint integration proxy lambda ARN"
}

output "fpjs_secret_manager_arn" {
  value       = aws_secretsmanager_secret.fpjs_proxy_lambda_secret.arn
  description = "Fingerprint secrets integration manager secret ARN"
}

# constants

output "fpjs_origin_name" {
  value       = "fpcdn.io"
  description = "Fingerprint Pro CDN origin domain name"
}

output "fpjs_origin_id" {
  value       = "fpcdn.io"
  description = "Fingerprint Pro CDN origin domain id"
}

output "fpjs_origin_request_policy_id" {
  value       = "216adef6-5c7f-47e4-b989-5492eafa07d3" # Default AllViewer policy
  description = "Fingerprint Pro CDN origin request policy id"
}
