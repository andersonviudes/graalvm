# GraalVM Docker Image

![Docker Pulls](https://img.shields.io/docker/pulls/andersonviudes/graalvm)
![Docker Image Size](https://img.shields.io/docker/image-size/andersonviudes/graalvm/latest)
![GitHub Actions](https://github.com/andersonviudes/graalvm-docker/workflows/Build%20and%20Push%20Docker%20Image/badge.svg)



## Introduction

Welcome to the **GraalVM Docker Image** repository! This project provides a lightweight and optimized Docker image for [GraalVM](https://www.graalvm.org/), a high-performance runtime that provides support for multiple programming languages and execution modes. Whether you're building Java applications, native images, or leveraging polyglot capabilities, this Docker image streamlines your development and deployment workflows.

## Features

- **Lightweight Base**: Built upon `debian:bullseye-slim` for minimal footprint.
- **Multi-Stage Build**: Ensures the final image is clean and contains only necessary artifacts.
- **Multi-Platform Support**: Compatible with `linux/amd64` and `linux/arm64` architectures.
- **Automated CI/CD**: Utilizes GitHub Actions to build and push images automatically to Docker Hub.
- **Version Tagging**: Supports both `latest` and specific version tags based on GraalVM versions.

## Prerequisites

Before using this Docker image or contributing to the repository, ensure you have the following:

- **Docker**: Installed on your local machine. [Install Docker](https://docs.docker.com/get-docker/)
- **Docker Hub Account**: To pull and push images. [Sign Up](https://hub.docker.com/signup)
- **GitHub Account**: For accessing GitHub Actions and contributing to the repository.

## Usage

### Pulling the Image

To pull the latest GraalVM Docker image from Docker Hub:

```bash
docker pull andersonviudes/graalvm:latest
