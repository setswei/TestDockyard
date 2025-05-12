#!/bin/bash
set -e

# Add Spock dependencies to classpath
CLASSPATH="/opt/spock/lib/*"

# Run tests
echo "Running Groovy property source tests..."
groovy -cp "$CLASSPATH" scripts/tests/property_sources/test_property_sources.groovy

echo "All Groovy tests passed!"
