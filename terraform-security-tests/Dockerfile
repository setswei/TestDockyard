FROM python:3.11-slim

LABEL maintainer="Your Organization"
LABEL description="Container for Terraform security and compliance testing"

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    unzip \
    git \
    jq \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform
ARG TERRAFORM_VERSION=1.6.6
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install tflint
ARG TFLINT_VERSION=0.48.0
RUN curl -LO https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip && \
    unzip tflint_linux_amd64.zip && \
    mv tflint /usr/local/bin/ && \
    rm tflint_linux_amd64.zip

# Install Checkov
RUN pip install --no-cache-dir checkov

# Install TFSec
ARG TFSEC_VERSION=1.28.4
RUN curl -LO https://github.com/aquasecurity/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 && \
    chmod +x tfsec-linux-amd64 && \
    mv tfsec-linux-amd64 /usr/local/bin/tfsec

# Install Terrascan
ARG TERRASCAN_VERSION=1.18.3
RUN curl -LO https://github.com/tenable/terrascan/releases/download/v${TERRASCAN_VERSION}/terrascan_${TERRASCAN_VERSION}_Linux_x86_64.tar.gz && \
    tar -xzf terrascan_${TERRASCAN_VERSION}_Linux_x86_64.tar.gz && \
    mv terrascan /usr/local/bin/ && \
    rm terrascan_${TERRASCAN_VERSION}_Linux_x86_64.tar.gz

# Install Terraform-docs
ARG TERRAFORM_DOCS_VERSION=0.16.0
RUN curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz && \
    tar -xzf terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz && \
    mv terraform-docs /usr/local/bin/ && \
    rm terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz

# Create working directory
WORKDIR /terraform

# Copy test runner script
COPY run_tests.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run_tests.sh

ENTRYPOINT ["/usr/local/bin/run_tests.sh"]
