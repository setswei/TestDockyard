#!/bin/bash
set -e

# Default directory to scan
TERRAFORM_DIR=${1:-"/terraform"}

echo "=== Terraform Security Testing Suite ==="
echo "Running tests on directory: $TERRAFORM_DIR"
echo

# Check if directory exists
if [ ! -d "$TERRAFORM_DIR" ]; then
  echo "Error: Directory $TERRAFORM_DIR does not exist"
  exit 1
fi

cd "$TERRAFORM_DIR"

# Run terraform init if .terraform directory doesn't exist
if [ -f "*.tf" ] && [ ! -d ".terraform" ]; then
  echo "=== Running Terraform Init ==="
  terraform init -backend=false
  echo
fi

# Run terraform validate
echo "=== Running Terraform Validate ==="
terraform validate || echo "Terraform validation failed"
echo

# Run tflint
echo "=== Running TFLint ==="
tflint --recursive || echo "TFLint found issues"
echo

# Run checkov
echo "=== Running Checkov ==="
checkov -d . --quiet || echo "Checkov found security issues"
echo

# Run tfsec
echo "=== Running TFSec ==="
tfsec . || echo "TFSec found security issues"
echo

# Run terrascan
echo "=== Running Terrascan ==="
terrascan scan -d . || echo "Terrascan found security issues"
echo

# Generate documentation
echo "=== Generating Terraform Documentation ==="
if [ -d "modules" ]; then
  for module in modules/*; do
    if [ -d "$module" ]; then
      echo "Generating docs for module: $module"
      terraform-docs markdown "$module" > "$module/README.md" || echo "Failed to generate docs for $module"
    fi
  done
else
  terraform-docs markdown . > TERRAFORM.md || echo "Failed to generate docs"
fi
echo

echo "=== Testing Complete ==="
echo "Check the output above for any security issues or warnings."
