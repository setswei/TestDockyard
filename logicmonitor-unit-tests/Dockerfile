FROM openjdk:11

# Install Groovy
ENV GROOVY_VERSION=3.0.9
RUN apt-get update && apt-get install -y wget unzip \
    && wget https://archive.apache.org/dist/groovy/${GROOVY_VERSION}/distribution/apache-groovy-binary-${GROOVY_VERSION}.zip \
    && unzip apache-groovy-binary-${GROOVY_VERSION}.zip -d /opt \
    && ln -s /opt/groovy-${GROOVY_VERSION} /opt/groovy \
    && rm apache-groovy-binary-${GROOVY_VERSION}.zip
ENV PATH=$PATH:/opt/groovy/bin

# Install Spock dependencies
RUN mkdir -p /opt/spock/lib
WORKDIR /opt/spock
RUN wget https://repo1.maven.org/maven2/org/spockframework/spock-core/2.0-groovy-3.0/spock-core-2.0-groovy-3.0.jar -O lib/spock-core.jar \
    && wget https://repo1.maven.org/maven2/junit/junit/4.13.2/junit-4.13.2.jar -O lib/junit.jar \
    && wget https://repo1.maven.org/maven2/org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar -O lib/hamcrest-core.jar

# Set working directory
WORKDIR /app

# Copy test runner script
COPY run_tests.sh /app/run_tests.sh
RUN chmod +x /app/run_tests.sh

ENTRYPOINT ["/app/run_tests.sh"]
