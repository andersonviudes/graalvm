# Stage 1: Builder
FROM debian:bullseye-slim AS builder

# Definir variáveis de ambiente para a versão do GraalVM
ENV GRAALVM_VERSION=23
ENV GRAALVM_BUILD=23
ENV JAVA_HOME=/usr/local/jvm/graalvm
ENV PATH=$JAVA_HOME/bin:$PATH

# Instalar dependências necessárias, incluindo build-essential para gcc
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget curl tar ca-certificates build-essential libz-dev && \
    mkdir -p /usr/local/jvm/graalvm && \
    wget -O graalvm.tar.gz https://download.oracle.com/graalvm/${GRAALVM_VERSION}/latest/graalvm-jdk-${GRAALVM_BUILD}_linux-x64_bin.tar.gz && \
    tar -xzf graalvm.tar.gz -C /usr/local/jvm/graalvm --strip-components=1 && \
    rm graalvm.tar.gz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Stage 2: Final Image
FROM debian:bullseye-slim

# Definir variáveis de ambiente para o GraalVM
ENV JAVA_HOME=/usr/local/jvm/graalvm
ENV PATH=$JAVA_HOME/bin:$PATH

# Copiar apenas o GraalVM do estágio de build
COPY --from=builder /usr/local/jvm/graalvm /usr/local/jvm/graalvm

# Definir diretório de trabalho
WORKDIR /workspace

# Comando padrão
CMD ["/bin/bash"]
