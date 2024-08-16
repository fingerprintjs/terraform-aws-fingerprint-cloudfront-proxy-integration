
locals {
  # TODO: When adapting this example, replace this with your actual website origin (directly or through a `terraform.tfvars` file)
  website_origin_domain_name = "yourwebsite.com"
  # TODO: When adapting this example, replace this with the path segment you want for your proxy integration (directly or through a `terraform.tfvars` file)
  #       Avoid ad blocker triggers like "fingerprint", "track", etc., a random value is the best choice
  fpjs_behavior_path = "metrics"
}

# Example CloudFront Distribution. 
# DO NOT USE AS-IS, Make sure to adjust the code to your needs and security practices before releasing to production.
resource "aws_cloudfront_distribution" "main_website_distribution" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for ${local.website_origin_domain_name}"
  default_root_object = "index.html"

  origin {
    domain_name = local.website_origin_domain_name
    origin_id   = "your-website"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "your-website"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

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

  ordered_cache_behavior {
    path_pattern = "${local.fpjs_behavior_path}/*"

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

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  # You can serve the distribution from your own domain
  #  - Uncomment the `aliases` and `viewer_certificate` below
  #  - Uncomment the 'aws_route53_record' below
  #  - Uncomment the DNS-related variables in `variables.tf`
  #  - Define the referenced variables in a `terraform.tfvars` file
  #  - Remove the default `viewer_certificate` above

  # aliases = [var.website_domain]
  # viewer_certificate {
  #   acm_certificate_arn = var.certificate_arn
  #   ssl_support_method  = "sni-only"
  # }
}

# resource "aws_route53_record" "apex_domain" {
#   zone_id = var.domain_zone_id
#   name    = var.website_domain
#   type    = "A"

#   alias {
#     name                   = aws_cloudfront_distribution.main_website_distribution.domain_name
#     zone_id                = aws_cloudfront_distribution.main_website_distribution.hosted_zone_id
#     evaluate_target_health = false
#   }
# }

