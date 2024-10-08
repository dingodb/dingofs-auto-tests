#!/usr/bin/env bash
set -e

echo "getting blogbench"
git clone https://github.com/emcrisostomo/Blogbench.git

pushd Blogbench/
echo "making blogbench"
./configure
make
pushd src
mkdir blogtest_in
echo "running blogbench"
./blogbench -d blogtest_in
popd
popd
