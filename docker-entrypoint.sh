#!/usr/bin/env sh

set -ex

# Graceful shutdown
trap 'pkill -TERM -P1; bitcoin-cli -chain=$CHAIN stop; exit 0' SIGTERM

# Run application
if [ -n '$PROXY' ]; then
  bitcoind -chain=${CHAIN} -rpcauth=${RPC_AUTH} -proxy=${PROXY}
else
  bitcoind -chain=${CHAIN} -rpcauth=${RPC_AUTH}
fi