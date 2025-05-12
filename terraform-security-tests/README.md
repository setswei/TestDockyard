# Terraform Security Testing Container

This Docker container provides an environment for testing Terraform configurations, focusing on security, compliance, and best practices.

## Features

- Terraform validation and linting
- Security scanning with multiple tools:
  - Checkov: Static code analysis for infrastructure-as-code
  - TFSec: Security scanner for Terraform code
  - Terrascan: Detect compliance and security violations
- Documentation generation with terraform-docs
- Comprehensive test reporting

## Included Tools

- **Terraform**: Infrastructure as Code tool
- **TFLint**: Terraform linter
- **Checkov**: Static code analysis for IaC
- **TFSec**: Security scanner for Terraform
- **Terrascan**: Compliance and security scanner
- **Terraform-docs**: Documentation generator

## Usage

### Building the Container

```bash
docker build -t your-org/terraform-security-tests .
```

### Running Tests

```bash
docker run --rm -v /path/to/your/terraform:/terraform your-org/terraform-security-tests
```

### Integration with CI/CD

Add this to your CI/CD pipeline:

```yaml
terraform-security:
  image: your-org/terraform-security-tests
  volumes:
    - ./terraform:/terraform
```

## Test Process

The container runs the following tests:

1. **Terraform Validate**: Checks for syntax errors and internal consistency
2. **TFLint**: Checks for possible errors and enforces best practices
3. **Checkov**: Scans for security and compliance issues
4. **TFSec**: Identifies potential security issues
5. **Terrascan**: Detects compliance and security violations
6. **Documentation Generation**: Creates or updates documentation

## Customization

You can customize the test execution by modifying the `run_tests.sh` script. For example, you can:

- Add additional security tools
- Configure test severity levels
- Adjust reporting formats
- Add custom policy checks

## Security Checks

### Checkov

Checkov scans cloud infrastructure configurations to find misconfigurations before they're deployed. It includes hundreds of built-in policies covering security and compliance best practices for AWS, Azure, GCP, and more.

### TFSec

TFSec is a security scanner for Terraform code, specializing in finding security issues that could be exploited when the infrastructure is deployed.

### Terrascan

Terrascan is a static code analyzer for Infrastructure as Code that detects compliance and security violations across multiple providers.

## Best Practices

- Run this container as part of your CI/CD pipeline
- Fix all high and critical security issues before deployment
- Review and address warnings even if they don't fail the build
- Keep the container updated with the latest tool versions
- Add custom policies specific to your organization's requirements
