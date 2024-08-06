# Example CloudFront Distribution. DO NOT USE AS-IS, and make sure to follow best practices before releasing to the production.
resource "aws_cloudfront_distribution" "fpjs_cloudfront_distribution" {
  comment = "Fingerprint proxy integration distribution (created via Terraform)"

  enabled = true

  http_version = "http1.1"

  price_class = "PriceClass_100"

  #region Fingerprint CloudFront Integration start
  origin {
    domain_name = module.fingerprint_cloudfront_integration.fpjs_origin_name
    origin_id   = module.fingerprint_cloudfront_integration.fpjs_origin_id
    custom_origin_config {
      origin_protocol_policy = "https-only"
      http_port              = 80
      https_port             = 443
      origin_ssl_protocols   = ["TLSv1.2"]
    }
    custom_header {
      name  = "FPJS_SECRET_NAME"
      value = module.fingerprint_cloudfront_integration.fpjs_secret_manager_arn
    }
  }

  default_cache_behavior {
    allowed_methods          = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods           = ["GET", "HEAD"]
    cache_policy_id          = module.fingerprint_cloudfront_integration.fpjs_cache_policy_id
    origin_request_policy_id = module.fingerprint_cloudfront_integration.fpjs_origin_request_policy_id
    target_origin_id         = module.fingerprint_cloudfront_integration.fpjs_origin_id
    viewer_protocol_policy   = "https-only"
    compress                 = true

    lambda_function_association {
      event_type   = "origin-request"
      lambda_arn   = module.fingerprint_cloudfront_integration.fpjs_proxy_lambda_arn
      include_body = true
    }
  }
  #endregion

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  aliases = [var.proxy_subdomain_domain]
  viewer_certificate {
    acm_certificate_arn = var.certificate_arn
    ssl_support_method  = "sni-only"
  }

  # If don't want to serve the distribution from a subdomain for now, use the default certificate instead
  # (comment out `viewer_certificate` and `aliases` above and use the `viewer_certificate` below)

  # viewer_certificate {
  #   cloudfront_default_certificate = true
  # }
}

# You can make the distribution available on a subdomain of your website
# (comment this out if you don't want to do that for now)
resource "aws_route53_record" "cloudfront_terraform_new_distribution_record" {
  zone_id = var.domain_zone_id
  name    = var.proxy_subdomain_domain
  type    = "CNAME"
  ttl     = 300
  records = [aws_cloudfront_distribution.fpjs_cloudfront_distribution.domain_name]
}
