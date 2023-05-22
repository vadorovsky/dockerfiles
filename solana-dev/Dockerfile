# FROM rust:1-buster AS build
FROM rust:1-buster AS build

RUN apt update \
    && apt install -y \
    libssl-dev \
    libudev-dev \
    pkg-config \
    zlib1g-dev \
    llvm \
    clang \
    cmake \
    make \
    libprotobuf-dev \
    protobuf-compiler

RUN groupadd --gid 1000 solana \
    && useradd --uid 1000 --gid solana --shell /bin/bash --create-home solana
USER solana
WORKDIR /home/solana

ENTRYPOINT []
