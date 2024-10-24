FROM debian:bullseye-slim AS builder

ENV GRAALVM_VERSION=21.3.0
ENV GRAALVM_BUILD=17

RUN apt-get update && \
    apt-get install -y --no-install-recommends wget curl tar && \
    mkdir -p /usr/local/jvm && \
    wget -O graalvm.tar.gz https://download.oracle.com/graalvm/${GRAALVM_VERSION}/latest/graalvm-jdk-${GRAALVM_VERSION}_linux-amd64.tar.gz && \
    tar -xzf graalvm.tar.gz -C /usr/local/jvm && \
    rm graalvm.tar.gz

# Stage 2: Final Image
FROM debian:bullseye-slim

ENV JAVA_HOME=/usr/local/jvm/graalvm-jdk-${GRAALVM_VERSION}
ENV PATH=$JAVA_HOME/bin:$PATH

COPY --from=builder /usr/local/jvm/graalvm-jdk-${GRAALVM_VERSION} /usr/local/jvm/graalvm-jdk-${GRAALVM_VERSION}


WORKDIR /workspace

CMD ["/bin/bash"]
