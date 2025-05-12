# LogicMonitor Unit Testing Container

This Docker container provides an environment for testing Groovy scripts, particularly LogicMonitor property sources.

## Features

- Groovy 3.0.9 runtime
- Spock testing framework
- JUnit integration
- Ready-to-use test runner

## Usage

### Building the Container

```bash
docker build -t logicmonitor-unit-tests .
```

### Running Tests

```bash
docker run --rm -v /path/to/your/project:/app logicmonitor-unit-tests
```

### Integration with Makefile

Add this to your Makefile:

```makefile
test-property-sources:
	@echo "Running property source tests with Docker..."
	@docker build -t logicmonitor-unit-tests -f logicmonitor-unit-tests/Dockerfile temp/docker/logicmonitor-unit-tests
	@docker run --rm -v $(PWD):/app logicmonitor-unit-tests
```

## Container Contents

- **Groovy 3.0.9**: The Groovy runtime environment
- **Spock Framework**: Testing and specification framework for Java and Groovy
- **JUnit**: Testing framework used by Spock
- **Test Runner**: Script to execute Groovy tests with the correct classpath

## Customization

You can customize the test execution by modifying the `run_tests.sh` script. For example, you can:

- Change the test directory
- Add additional dependencies
- Configure test reporting

## Dependencies

- openjdk:11 (base image)
- Groovy 3.0.9
- Spock Core 2.0
- JUnit 4.13.2
- Hamcrest Core 1.3
