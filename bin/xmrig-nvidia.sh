#!/usr/bin/env bash

CRYPTO=cryptonight
POOL=
WALLET=

nvidia-docker run -d \
  --name xmrig-nvidia merxnet/xmrig-nvidia \
  -k \
  -a ${CRYPTO} \
  -o ${POOL} \
  -u ${WALLET}
