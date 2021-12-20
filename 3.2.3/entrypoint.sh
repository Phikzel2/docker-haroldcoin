#!/bin/sh
set -e

datadir="/home/haroldcoin/.haroldcoin"

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for haroldcoind"

  set -- haroldcoind "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "haroldcoind" ]; then
  echo "Creating data directory ..."
  mkdir -p "$datadir"
  chmod 700 "$datadir"
  chown -R haroldcoin "$datadir"

  echo "$0: setting data directory to $datadir"

  set -- "$@" -datadir="$datadir"
fi

if [ "$1" = "haroldcoind" ] || [ "$1" = "haroldcoin-cli" ] || [ "$1" = "haroldcoin-tx" ]; then
  echo "$@"
  exec su-exec haroldcoin "$@"
fi

echo
exec "$@"