module "fingerprint_cloudfront_integration" {
  source = "../.."

  fpjs_shared_secret       = var.fpjs_shared_secret
  // In standalone distribution, the integration is served under `/` path, so integration path depth needs to be set to 0
  integration_path_depth = 0

  // You can define the proxy function's [permission boundary](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_boundaries.html)
  // See https://dev.fingerprint.com/docs/aws-cloudfront-integration-via-terraform#defining-a-permission-boundary-for-the-proxy-function
  // fpjs_proxy_lambda_role_permissions_boundary_arn = "arn:aws:iam::<YOUR_ACCOUNT_ID>:policy/YOUR_POLICY_NAME"
}
