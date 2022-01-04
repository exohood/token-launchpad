#!/usr/bin/env bash
set -e
for file in "scripts/templated-tests/configs/token"/**/*
do
  echo "testing file "$file
  source $(dirname "$0")/templated-tests/compile-token-template.sh $file && source $(dirname "$0")/templated-tests/test-token-template.sh $file || error "failed test "$file
done
