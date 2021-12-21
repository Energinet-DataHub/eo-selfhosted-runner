# Base ubuntu image
FROM ubuntu:20.04

# Github runner version https://github.com/actions/runner/releases
ARG VERSION="2.285.1"

# Set workdir
WORKDIR /home/runner/actions-runner

# Add user, update and install packages
RUN DEBIAN_FRONTEND=noninteractive &&\
    useradd -m runner &&\
    apt-get update -y &&\
    apt-get upgrade -y &&\
    apt-get install -y --no-install-recommends curl ca-certificates

# Mkdir for runner, download, unzip and chown. 
RUN curl -o runner.tar.gz -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-x64-${VERSION}.tar.gz &&\
    tar xzf runner.tar.gz &&\
    rm runner.tar.gz &&\
    chown -R runner ~runner &&\
    ./bin/installdependencies.sh

# Copy start.sh file and set ownership
COPY start.sh ./start.sh
RUN chown runner ./start.sh

# Set user as "runner"
USER runner

# Set entrypoint and basic parameters
ENTRYPOINT ["./start.sh"]
