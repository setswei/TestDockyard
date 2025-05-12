#!/bin/bash
set -e

echo "Running Python Lambda tests and security checks..."

# Run security checks - only fail on high severity issues
echo "Running Bandit security checks..."
bandit -r src/lambda/ -f txt -ll HIGH  # Only fail on high severity issues

echo "Running Safety dependency checks..."
safety check --full-report --ignore-unpinned || true  # Report all issues but don't fail the pipeline

# Run linting - report issues but don't fail
echo "Running Pylint..."
pylint src/lambda/ || true

echo "Running Flake8..."
flake8 src/lambda/ || true

# Run unit tests - these must pass
echo "Running unit tests with pytest..."
pytest scripts/tests/lambda/test_lambda_functions.py -v

echo "All Python tests and security checks completed!"
