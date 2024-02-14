FROM ubuntu:xenial-20210429

RUN apt update && \
    apt install -y wget curl findutils; \
    apt-get -yq autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/local/jvm/ && cd /usr/local/jvm/ && \
    wget https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz && \
    tar -xzf graalvm-jdk-21_linux-x64_bin.tar.gz && \
    rm -f graalvm-jdk-21_linux-x64_bin.tar.gz

ENV PATH=/usr/local/jvm/graalvm-jdk-21.0.2+13.1/bin
ENV JAVA_HOME=/usr/local/jvm/graalvm-jdk-21.0.2+13.1/


CMD bin/bash
