# docker-bitcoin

[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)


**Bitcoind running in docker container with JSON-RPC enabled.**

[Bitcoin Core](https://bitcoincore.org/) is an open source project which maintains and releases Bitcoin client software called “Bitcoin Core”.

### Ports

* `8080` - REST interface port.

#### JSON-RPC ports

* `8332` - mainnet.
* `18332` - regnet.
* `18443` - testnet.

#### P2P network ports

* `8333` - mainnet.
* `18333` - regnet.
* `18444` - testnet.

#### ZMQ ports

* `28332` - transactions.
* `28333` - blocks.

### Volumes

* `/data` - user data folder (on host it usually has a path ``/home/user/.bitcoin``).


## Getting started

#### get rpcauth pair


Generate the rpcauth pair [there](https://jlopp.github.io/bitcoin-core-rpc-auth-generator/) and paste it into the `docker-compose.yml` file or before the command: `RPC_AUTH=user:hash docker compose up`

#### docker-compose

[docker-compose.yml](https://github.com/slashfast/docker-bitcoin/blob/main/docker-compose.yml) to see minimal working setup. When running in production, you can use this as a guide.

```bash
git clone https://github.com/slashfast/docker-bitcoin.git
cd docker-bitcoin
docker compose up
```

Before use JSON-RPC, two parameters must be added to the `bitcoin.conf` which must be created in the `.bitcoin` directory:

```
rpcbind=<ip>
rpcallowip=<cidr>
```
After you can send requests:

```bash
curl --data-binary '{"jsonrpc": "1.0", "id": "test", "method": "getblockchaininfo", "params": []}'  http://bitcoin:changeme@127.0.0.1:8332
```

:exclamation:**Warning**:exclamation:

Always link bitcoind to containers or bind to localhost directly and not expose JSON-RPC ports for security reasons.

## License

See [LICENSE](https://github.com/slashfast/docker-bitcoin/blob/main/LICENSE)
