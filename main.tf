terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.2"
    }
  }
}

resource "random_id" "integration_id" {
  byte_length = 6
}

locals {
  integration_id = random_id.integration_id.hex
}

# region cache policy

resource "aws_cloudfront_cache_policy" "fpjs_procdn" {
  name        = "FingerprintProCDNCachePolicy-${local.integration_id}"
  default_ttl = 180
  max_ttl     = 180
  min_ttl     = 0

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "whitelist"
      query_strings {
        items = ["version", "loaderVersion"]
      }
    }

    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip   = true
  }
}

# endregion

# region proxy lambda

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    sid    = "AllowAwsToAssumeRole"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com", "edgelambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy" "fpjs_proxy_lambda" {
  name = "AWSSecretAccess"
  role = aws_iam_role.fpjs_proxy_lambda.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "secretsmanager:GetSecretValue",
        ]
        Effect   = "Allow"
        Resource = aws_secretsmanager_secret.fpjs_proxy_lambda_secret.arn
      },
    ]
  })
}

resource "aws_iam_role" "fpjs_proxy_lambda" {
  name               = "fingerprint-pro-lambda-role-${local.integration_id}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_s3_object" "fpjs_integration_s3_bucket" {
  bucket = "fingerprint-pro-cloudfront-integration"
  key    = "v2/lambda_latest.zip"
}

resource "aws_lambda_function" "fpjs_proxy_lambda" {
  s3_bucket        = data.aws_s3_object.fpjs_integration_s3_bucket.bucket
  s3_key           = data.aws_s3_object.fpjs_integration_s3_bucket.key
  function_name    = "fingerprint-pro-cloudfront-lambda-${local.integration_id}"
  role             = aws_iam_role.fpjs_proxy_lambda.arn
  handler          = "fingerprintjs-pro-cloudfront-lambda-function.handler"
  source_code_hash = data.aws_s3_object.fpjs_integration_s3_bucket.etag

  runtime = "nodejs20.x"

  publish = true
}

# endregion

# region secrets manager

resource "aws_secretsmanager_secret" "fpjs_proxy_lambda_secret" {
  name        = "fingerprint-pro-cloudfront-integration-settings-secret-${local.integration_id}"
  description = "AWS Secret with a custom Fingerprint integration settings (created via Terraform)"
}

resource "aws_secretsmanager_secret_version" "fpjs_proxy_lambda_secret" {
  secret_id = aws_secretsmanager_secret.fpjs_proxy_lambda_secret.id
  secret_string = jsonencode(
    {
      fpjs_get_result_path     = var.fpjs_get_result_path
      fpjs_agent_download_path = var.fpjs_agent_download_path
      fpjs_pre_shared_secret   = var.fpjs_shared_secret
    }
  )
}

# endregion
