FROM maven:3.8.1-openjdk-8-slim

RUN apt-get update \
    && apt-get install docker.io -y \
    && rm -rf /var/lib/apt/lists/*

COPY ./daemon.json /etc/docker/

CMD service docker restart