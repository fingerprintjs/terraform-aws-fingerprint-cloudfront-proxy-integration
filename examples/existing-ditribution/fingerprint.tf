module "fingerprint_cloudfront_integration" {
  source = "git@github.com:fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration.git"

  fpjs_agent_download_path = var.fpjs_agent_download_path
  fpjs_get_result_path     = var.fpjs_get_result_path
  fpjs_shared_secret       = var.fpjs_shared_secret
}
