#!/bin/bash

set -e

solana config set --url http://localhost:8899

exec /usr/local/bin/solana-test-validator \
    --bpf-program noopb9bkMVfRPU8AsbpTUg8AQkHtKwMYZiFUjNRtMmV /usr/local/lib/solana-program-library/spl_noop.so \
    "$@"
