#!/usr/bin/env bash
node node_modules/.bin/c-preprocessor --config $1 template/GameAssetsContract.sol contracts/GameAssetsContract.sol
