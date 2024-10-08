#!/bin/bash

set -ex

mkdir -p fsstress
pushd fsstress
wget  http://172.30.14.127/ltp.tar.gz
tar -zxvf ltp.tar.gz
pushd ltp
make autotools
./configure
make
pushd testcases/kernel/fs/fsstress
BIN=$(readlink -f fsstress)
popd
popd
popd

T=$(mktemp -d -p .)
"$BIN" -d "$T" -l 1 -n 1000 -p 10 -v
rm -rf -- "$T"
