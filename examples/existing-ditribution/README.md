## Existing CloudFront Distribution Example

This project is an example of how to add the [Fingerprint proxy integration Terraform module](https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration) to your existing CloudFront distribution.

This is the recommended approach for maximum possible accuracy. Learn more in the [CloudFront Proxy Terraform installation guide](https://dev.fingerprint.com/docs/aws-cloudfront-integration-via-terraform).

### Running the example

To quickly run the example for testing purposes, you can:

1. Copy the [terraform.tfvars.example](./terraform.tfvars.example) file into a new `terraform.tfvars` file and replace the values with your own. The variables are defined and described in the [variables.tf](./variables.tf) file.
2. Run `terraform init`.
3. Run `terraform plan`.
4. Run `terraform apply`.

### Using in production

This is a simplified example. Use it as a reference but make sure to **adjust the code to your needs and security practices** before deploying it to production environments.

### Additional resources

- [Fingerprint CloudFront Proxy Integration documentation](https://dev.fingerprint.com/docs/cloudfront-proxy-integration-v2)
