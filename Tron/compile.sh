#!/usr/bin/env bash
set -e
rm -rf build
# remove solc from truffle to use our version
# rm -rf node_modules/truffle/node_modules/solc
# inc build number and set hash
# sed  -r -i 's/^(.*VERSION\s*=\s*)(0[xX][0-Fa-f]{16})(.*)$/nodejs utils\/ver.js "\1" "\2" "\3" "$(git rev-parse --short HEAD)"/ge' contracts/JouleConsts.sol
node_modules/.bin/truffle compile --all
# complete compilation (looks like truffle bug)
node_modules/.bin/truffle compile
