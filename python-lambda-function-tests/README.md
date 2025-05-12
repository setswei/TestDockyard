# Python Lambda Testing Container

This Docker container provides an environment for testing Python Lambda functions, including security testing.

## Features

- Python 3.13 runtime
- pytest for unit testing
- moto for AWS service mocking
- Security testing tools:
  - Bandit: Static code security analysis
  - Safety: Dependency vulnerability checking
- Code quality tools:
  - Pylint: Python linting
  - Flake8: Style guide enforcement
  - Black: Code formatting

## Usage

### Building the Container

```bash
docker build -t setswei/python-lambda-testing .
```

### Running Tests

```bash
docker run --rm -v /path/to/your/project:/app setswei/python-lambda-testing
```

### Integration with Makefile

Add this to your Makefile:

```makefile
test-lambda:
	@echo "Running Lambda tests with Docker..."
	@docker run --rm -v $(PWD):/app setswei/python-lambda-testing
```

## Container Contents

- **Python 3.13**: The Python runtime environment
- **pytest**: Testing framework for Python
- **moto**: AWS service mocking library
- **Security Tools**: Bandit and Safety
- **Linting Tools**: Pylint, Flake8, and Black
- **Test Runner**: Script to execute Python tests and security checks

## Customization

You can customize the test execution by modifying the `run_tests.sh` script. For example, you can:

- Change the test directory
- Add additional dependencies
- Configure test reporting
- Adjust security check severity levels

## Security Checks

### Bandit

Bandit is a tool designed to find common security issues in Python code. It scans the codebase for patterns that might indicate security vulnerabilities.

The pipeline is configured to:
- Report all security issues (low, medium, high)
- Only fail the build on high severity issues
- Use the `-ll HIGH` flag to set this threshold

### Safety

Safety checks your installed dependencies for known security vulnerabilities. It uses the Python Safety DB, which is a curated database of Python package vulnerabilities.

The pipeline is configured to:
- Report all vulnerability issues
- Show a full report with details
- Not fail the build on vulnerabilities (can be adjusted if needed)
- Ignore unpinned dependencies to reduce noise

## Code Quality Checks

### Pylint

Pylint is a static code analysis tool that looks for programming errors, helps enforce a coding standard, and sniffs for code smells.

### Flake8

Flake8 is a wrapper around PyFlakes, pycodestyle, and McCabe complexity. It checks for PEP 8 compliance and programming errors.

### Black

Black is an uncompromising code formatter. It reformats entire files in place, making code review easier and reducing the time spent on code formatting discussions.
