# phikzel2/haroldcoin

A multiarch HAROLDCOIN docker image.

[![phikzel2/haroldcoin][docker-pulls-image]][docker-hub-url] [![phikzel2/haroldcoin][docker-stars-image]][docker-hub-url]

## Tags

- `3.2.3`, `latest` ([3.2.3/Dockerfile](https://github.com/phikzel2/docker-haroldcoin/blob/master/3.2.3))

**Picking the right tag**

- `phikzel2/haroldcoin:latest`: points to the latest stable release available of HAROLDCOIN. Use this only if you know what you're doing as upgrading HAROLDCOIN blindly is a risky procedure.
- `phikzel2/haroldcoin:<version>`: points to a specific version branch or release of HAROLDCOIN. Uses the pre-compiled binaries which are fully tested by the HAROLDCOIN team.

## What is HAROLDCOIN?

HAROLDCOIN is an open source crypto-currency focused on fast private transactions using the Zerocoin protocol, with low transaction fees & environmental footprint. It utilizes the first ever anonymous proof of stake protocol, called zPoS, combined with regular PoS and masternodes for securing its network. Learn more about [HAROLDCOIN](https://github.com/HAROLDCOIN-Project/HAROLDCOIN).

## Usage

### How to use this image

This image contains the main binaries from the HAROLDCOIN project - `haroldcoind`, `haroldcoin-cli` and `haroldcoin-tx`. It behaves like a binary, so you can pass any arguments to the image and they will be forwarded to the `haroldcoind` binary:

```sh
❯ docker run --rm phikzel2/haroldcoin \
  -printtoconsole \
  -rpcallowip=172.17.0.0/16 \
  -rpcauth='foo:1e72f95158becf7170f3bac8d9224$957a46166672d61d3218c167a223ed5290389e9990cc57397d24c979b4853f8e'
```

By default, `haroldcoind` will run as user `haroldcoin` for security reasons and with its default data dir (`~/.haroldcoin`). If you'd like to customize where `haroldcoind` stores its data, you must use the `DATA_DIR` environment variable. The directory will be automatically created with the correct permissions for the `haroldcoin` user and `haroldcoind` automatically configured to use it.

You can also mount a directory in a volume under `/home/haroldcoin/.haroldcoin` in case you want to access it on the host:

```sh
❯ docker run -v ${PWD}/data:/home/haroldcoin/.haroldcoin --rm phikzel2/haroldcoin \
  -printtoconsole \
  -regtest=1
```

You can optionally create a service using `docker-compose`:

```yml
haroldcoin:
  image: phikzel2/haroldcoin
  command: -printtoconsole
    -regtest=1
```

#### Mainnet

- JSON-RPC/REST: 25674
- P2P: 25676

## License

The [phikzel2/haroldcoin][docker-hub-url] docker project is under MIT license.

[docker-hub-url]: https://hub.docker.com/r/phikzel2/haroldcoin
[docker-pulls-image]: https://img.shields.io/docker/pulls/phikzel2/haroldcoin.svg?style=flat-square
[docker-stars-image]: https://img.shields.io/docker/stars/phikzel2/haroldcoin.svg?style=flat-square
