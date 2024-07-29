## How to Install

### Using a new CloudFront distribution

1. Create a new directory `mkdir fingerprint_integration` and go inside `cd fingerprint_integration`
2. Create a file `touch fingerprint.tf` and add below content, do not forget to replace placeholders (`AGENT_DOWNLOAD_PATH_HERE`, `RESULT_PATH_HERE`, `PROXY_SECRET_HERE`):
     ```terraform
     module "fingerprint_cloudfront_integration" {
       source = "git@github.com:necipallef/terraform-module-proxy-lambda.git/?ref=v0.7.1"
     
       fpjs_agent_download_path = "AGENT_DOWNLOAD_PATH_HERE"
       fpjs_get_result_path     = "RESULT_PATH_HERE"
       fpjs_shared_secret   = "PROXY_SECRET_HERE"
     }
     ```
3. Create a file called `cloudfront_distribution.tf` and add below content (feel free to make any changes that makes sense for your setup):
   ```terraform

    resource "aws_cloudfront_distribution" "fpjs_cloudfront_distribution" {
      comment = "Fingerprint distribution (created via Terraform)"
    
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
    
      enabled = true
    
      http_version = "http1.1"
    
      price_class = "PriceClass_100"
    
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
    
      viewer_certificate {
        cloudfront_default_certificate = true
      }
    
      restrictions {
        geo_restriction {
          restriction_type = "none"
        }
      }
    }
   ```
   If you wish to connect a custom domain for first-party benefits, consider changing `viewer_certificate` field accordingly. Refer to [official documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) by HashiCorp for further customization.
4. Run `terraform init`
5. Run `terraform plan`, if all looks good run `terraform apply`

### Using existing CloudFront distribution

1. Create a file called `fingerprint.tf` and add below content, do not forget to replace placeholders (`AGENT_DOWNLOAD_PATH_HERE`, `RESULT_PATH_HERE`, `PROXY_SECRET_HERE`):
    ```terraform
    module "fingerprint_cloudfront_integration" {
        source = "git@github.com:necipallef/terraform-module-proxy-lambda.git/?ref=v0.7.1"

        fpjs_agent_download_path = "AGENT_DOWNLOAD_PATH_HERE"
        fpjs_get_result_path     = "RESULT_PATH_HERE"
        fpjs_shared_secret   = "PROXY_SECRET_HERE"
    }
    ```
2. Go to your CloudFront distribution block and add below content, do not forget to replace placeholders (`YOUR_INTEGRATION_PATH_HERE`):
    ```terraform
    resource "aws_cloudfront_distribution" "cloudfront_dist" {
      // more code here
    
      #region fingerprint start
    
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
        path_pattern = "YOUR_INTEGRATION_PATH_HERE/*"
    
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
    
      // more code here
    }
    ```
3. Run `terraform plan`, if all looks good run `terraform apply`

> [!NOTE]
> If your project doesn't use `hashicorp/random` module, then you will need to run `terraform init -upgrade`.

## Todo
- [ ] create a public repo on company account with name `terraform-aws-fingerprint-cloudfront-integration`
- [ ] publish on Hashicorp account
