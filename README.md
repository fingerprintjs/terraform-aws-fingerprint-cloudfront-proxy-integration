<p align="center">
  <a href="https://fingerprint.com">
    <picture>
     <source media="(prefers-color-scheme: dark)" srcset="https://fingerprintjs.github.io/home/resources/logo_light.svg" />
     <source media="(prefers-color-scheme: light)" srcset="https://fingerprintjs.github.io/home/resources/logo_dark.svg" />
     <img src="https://fingerprintjs.github.io/home/resources/logo_dark.svg" alt="Fingerprint logo" width="312px" />
   </picture>
  </a>
</p>

<p align="center">
<a href="https://github.com/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration"><img src="https://img.shields.io/github/v/release/fingerprintjs/terraform-aws-fingerprint-cloudfront-proxy-integration" alt="Current version"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/:license-mit-blue.svg" alt="MIT license"></a>
<a href="https://discord.gg/39EpE2neBg"><img src="https://img.shields.io/discord/852099967190433792?style=logo&label=Discord&logo=Discord&logoColor=white" alt="Discord server"></a>
</p>

# Fingerprint Pro CloudFront Integration (Terraform module)

[Fingerprint](https://fingerprint.com/) is a device intelligence platform offering 99.5% accurate visitor identification.

Fingerprint Pro CloudFront Integration is responsible for

- Proxying download requests of the latest Fingerprint Pro JS Agent between your site and Fingerprint CDN.
- Proxying identification requests and responses between your site and Fingerprint Pro's APIs.

This [improves](https://dev.fingerprint.com/docs/cloudfront-proxy-integration#the-benefits-of-using-the-cloudfront-integration) both accuracy and reliability of visitor identification and bot detection on your site.

You can install the CloudFront proxy integration using a [CloudFormation template](https://github.com/fingerprintjs/fingerprint-pro-cloudfront-integration) or as a Terraform module included in this repository. For more details, see the [full documentation](https://dev.fingerprint.com/docs/cloudfront-proxy-integration-v2).

## Requirements

- AWS Account.
- Access to an IAM role in AWS with privileges to manage IAM roles, CloudFront distributions, Secrets Manager, Lambda Functions, and S3 Read Only access.
- Terraform project using the [AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) with the IAM role described above.
- [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

> [!IMPORTANT]  
> The AWS CloudFront Proxy Integration is exclusively supported for customers on the Enterprise Plan. Other customers are encouraged to use [Custom subdomain setup](https://dev.fingerprint.com/docs/custom-subdomain-setup) or [Cloudflare Proxy Integration](https://dev.fingerprint.com/docs/cloudflare-integration).

> [!WARNING]  
> The underlying data contract in the identification logic can change to keep up with browser updates. Using the AWS CloudFront Proxy Integration might require occasional manual updates on your side. Ignoring these updates will lead to lower accuracy or service disruption.

## How to install

To set up CloudFront integration using Terraform, you need to:

1. Add the Fingerprint Terraform module to your Terraform project.
2. Use the module in the configuration of your CloudFront distribution.
3. Deploy your Terraform project.
4. Configure the Fingerprint Pro JS Agent on your site to communicate with your created Lambda@Edge function using the [scriptUrlPattern](https://dev.fingerprint.com/docs/js-agent#scripturlpattern) and [endpoint](https://dev.fingerprint.com/docs/js-agent#endpoint) parameters.

See [CloudFront Proxy Integration guide](https://dev.fingerprint.com/docs/cloudfront-proxy-integration-v2) in our documentation for step-by-step instructions and follow the [Terraform installation method](https://dev.fingerprint.com/docs/aws-cloudfront-integration-via-terraform). If you have any questions, reach out to our [support team](https://fingerprint.com/support/).

## Examples

This repository also includes the following Terraform project examples. Use these examples as a reference, and make sure to follow best practices when provisioning CloudFront distributions:

- [Adding the Fingerprint proxy integration to an existing CloudFront distribution](./examples//existing-ditribution/) (recommended)
- [Creating a new CloudFront distribution just for the Fingerprint proxy integration](./examples/standalone-distribution/)

## How to update

The Terraform module does include any mechanism for automatic updates. To keep your integration up to date, please run `terraform apply` regularly.

## License

This project is licensed under the MIT license. See the [LICENSE](/LICENSE) file for more info.
