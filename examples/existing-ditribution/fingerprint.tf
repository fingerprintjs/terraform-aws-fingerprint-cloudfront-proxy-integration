module "fingerprint_cloudfront_integration" {
  source = "fingerprintjs/fingerprint-cloudfront-proxy-integration/aws"

  fpjs_agent_download_path = var.fpjs_agent_download_path
  fpjs_get_result_path     = var.fpjs_get_result_path
  fpjs_shared_secret       = var.fpjs_shared_secret
  // fpjs_proxy_lambda_role_permissions_boundary_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}
