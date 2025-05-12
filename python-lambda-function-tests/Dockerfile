FROM python:3.13-slim

# Install dependencies
RUN pip install --no-cache-dir \
    pytest \
    pytest-cov \
    moto \
    boto3 \
    bandit \
    safety \
    pylint \
    flake8 \
    black

# Set working directory
WORKDIR /app

# Copy test runner script
COPY run_tests.sh /app/run_tests.sh
RUN chmod +x /app/run_tests.sh

ENTRYPOINT ["/app/run_tests.sh"]
