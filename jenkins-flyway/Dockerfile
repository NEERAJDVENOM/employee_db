FROM jenkins/jenkins:lts

USER root

# Install required tools
RUN apt update && apt install -y wget unzip

# Download Flyway
RUN wget https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/10.10.0/flyway-commandline-10.10.0-linux-x64.tar.gz \
    && tar -xvzf flyway-commandline-10.10.0-linux-x64.tar.gz \
    && mv flyway-10.10.0 /opt/flyway

# Make Flyway globally available
RUN ln -s /opt/flyway/flyway /usr/local/bin/flyway

# Cleanup
RUN rm -f flyway-commandline-10.10.0-linux-x64.tar.gz

USER jenkins
