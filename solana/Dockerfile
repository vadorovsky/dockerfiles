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
RUN cargo install --git https://github.com/coral-xyz/anchor --tag v0.26.0 anchor-cli --locked
WORKDIR /usr/local/src
RUN git clone -b audit https://github.com/ananas-block/solana
RUN git clone -b account-compression-v0.1.8 https://github.com/solana-labs/solana-program-library
WORKDIR /usr/local/src/solana
RUN ./scripts/cargo-install-all.sh /usr/local
WORKDIR /usr/local/src/solana-program-library/account-compression
RUN anchor build
RUN mkdir -p /usr/local/lib/solana-program-library
RUN ln -s /usr/local/src/solana-program-library/account-compression/target/deploy/*.so \
    /usr/local/lib/solana-program-library

COPY entrypoint.sh /usr/local/bin

# FROM debian:buster-slim
# 
# COPY --from=build /solana/target/release/solana-test-validator \
#     /usr/local/bin/solana-test-validator

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
