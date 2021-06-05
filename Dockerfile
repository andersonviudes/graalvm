FROM ubuntu:xenial-20210429

RUN apt update && \
    apt install -y wget curl ; \
    apt-get -yq autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/local/jvm/ && cd /usr/local/jvm/ && \
    wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.1.0/graalvm-ce-java11-linux-amd64-21.1.0.tar.gz && \
    tar -xzf graalvm-ce-java11-linux-amd64-21.1.0.tar.gz && \
    rm -f graalvm-ce-java11-linux-amd64-21.1.0.tar.gz

ENV PATH=/usr/local/jvm/graalvm-ce-java11-21.1.0/bin
ENV JAVA_HOME=/usr/local/jvm/graalvm-ce-java11-21.1.0/


CMD bin/bash