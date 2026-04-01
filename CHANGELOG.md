## 1.2.0-rc.0

### Minor Changes

- Updated Lambda runtime to nodejs24.x ([bb51b6c](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/bb51b6c6e3e515cb0aba36b089a20450ddb9f3c8))
- Add `integration_path_depth` variable ([15510de](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/15510de03711b0b6aef819b3b497a93ff2d32ac9))
- Make V3-related variables optional (`fpjs_get_result_path`, `fpjs_agent_download_path`) ([f8d8bec](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/f8d8bec9020a529baa130970a13f54a0eab00141))
- Updated examples to reflect changes needed for V4 support ([390a79b](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/390a79b72caa53ea853c8df4b28f0e8c3a9e40da))

## [1.1.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v1.1.0...v1.1.1) (2025-07-14)

### Bug Fixes

- remove usage of deprecated managed_policy_arns attribute ([07e97ae](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/07e97ae7e987c84b644e19bcf06289a015f31e63))

## [1.1.1-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v1.1.0...v1.1.1-rc.1) (2025-07-09)

### Bug Fixes

- remove usage of deprecated managed_policy_arns attribute ([07e97ae](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/07e97ae7e987c84b644e19bcf06289a015f31e63))

## [1.1.0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v1.0.1...v1.1.0) (2025-05-07)

### Features

- add support for using locally built lambda function ([924e6cf](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/924e6cf1dbbe1410096e63daf71ba778be3e903f))

## [1.1.0-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v1.0.1...v1.1.0-rc.1) (2025-05-07)

### Features

- add support for using locally built lambda function ([924e6cf](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/924e6cf1dbbe1410096e63daf71ba778be3e903f))

## [1.0.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v1.0.0...v1.0.1) (2025-03-27)

### Bug Fixes

- relax hashicorp/random provider's patch version ([70b27a0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/70b27a07985409e6cdd97f08b8a29202132c75f6))
- remove hard patch version from aws provider from our module ([9059802](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/90598021dec6b5a197cd0f742aac6edefce2feef))

## [1.0.1-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v1.0.0...v1.0.1-rc.1) (2025-03-26)

### Bug Fixes

- relax hashicorp/random provider's patch version ([70b27a0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/70b27a07985409e6cdd97f08b8a29202132c75f6))
- remove hard patch version from aws provider from our module ([9059802](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/90598021dec6b5a197cd0f742aac6edefce2feef))

## [1.0.0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.6.0...v1.0.0) (2024-08-13)

### ⚠ BREAKING CHANGES

- v1.0.0

### Features

- v1.0.0 ([ce61945](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/ce61945ddfc4a51fd7d8c4edf5e790dfc7117aad))

## [1.0.0-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.6.0...v1.0.0-rc.1) (2024-08-13)

### ⚠ BREAKING CHANGES

- v1.0.0

### Features

- v1.0.0 ([ce61945](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/ce61945ddfc4a51fd7d8c4edf5e790dfc7117aad))

## [0.6.0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.5.0...v0.6.0) (2024-08-13)

### Features

- proxy lambda description, timeout and memory size config ([aebb1c1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/aebb1c132ae44082b17effaf4f8d75cfc271a559))

## [0.6.0-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.5.0...v0.6.0-rc.1) (2024-08-13)

### Features

- proxy lambda description, timeout and memory size config ([aebb1c1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/aebb1c132ae44082b17effaf4f8d75cfc271a559))

## [0.5.0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.4.0...v0.5.0) (2024-08-12)

### Features

- ability to add permissions_boundary to proxy lambda ([372ba9f](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/372ba9faf3c390f2274612220ce39e08cba58f40))
- proxy lambda ability to create logs ([8896610](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/8896610bfc1b2dfa7604ece452824ed1df6fb1ce))

### Bug Fixes

- add missing min required terraform version ([6e358e4](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/6e358e43d62449372ab7a416cd47784e4abb0a1b))
- add missing min required terraform version ([0e9e0a7](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/0e9e0a7fd2cd956c49afdeb2e5d4778b9e95338e))
- add missing min required terraform version ([336a0f6](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/336a0f6a44eca2b941508efd6d465b943d0b2eec))
- remove validation from fpjs_proxy_lambda_role_permissions_boundary_arn ([830c0f4](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/830c0f48202399b7cacaac357451ba3101072018))

## [0.5.0-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.4.0...v0.5.0-rc.1) (2024-08-12)

### Features

- ability to add permissions_boundary to proxy lambda ([372ba9f](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/372ba9faf3c390f2274612220ce39e08cba58f40))
- proxy lambda ability to create logs ([8896610](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/8896610bfc1b2dfa7604ece452824ed1df6fb1ce))

### Bug Fixes

- add missing min required terraform version ([6e358e4](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/6e358e43d62449372ab7a416cd47784e4abb0a1b))
- add missing min required terraform version ([0e9e0a7](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/0e9e0a7fd2cd956c49afdeb2e5d4778b9e95338e))
- add missing min required terraform version ([336a0f6](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/336a0f6a44eca2b941508efd6d465b943d0b2eec))
- remove validation from fpjs_proxy_lambda_role_permissions_boundary_arn ([830c0f4](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/830c0f48202399b7cacaac357451ba3101072018))

## [0.4.0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.3.0...v0.4.0) (2024-08-09)

### Features

- v0.4.0 ([1e804ef](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/1e804ef732cf6015ea8fba7410ae95586c87cc76))

## [0.4.0-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.3.0...v0.4.0-rc.1) (2024-08-09)

### Features

- v0.4.0 ([1e804ef](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/1e804ef732cf6015ea8fba7410ae95586c87cc76))

## [0.3.0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.2.0...v0.3.0) (2024-08-08)

### Features

- v0.3.0 ([d7c99b3](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/d7c99b34039147b2822125c1360bd056b2d11199))

## [0.3.0-rc.1](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.2.0...v0.3.0-rc.1) (2024-08-08)

### Features

- v0.3.0 ([d7c99b3](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/d7c99b34039147b2822125c1360bd056b2d11199))

## [0.2.0](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/compare/v0.1.3...v0.2.0) (2024-08-08)

### Features

- v0.2.0 ([4fa25f3](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration/commit/4fa25f30deae9272143f822749d055124e0f69f5))
