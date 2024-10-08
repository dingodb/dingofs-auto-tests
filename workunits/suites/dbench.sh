#!/usr/bin/env bash

set -e
wget  http://172.30.14.127/dbench.tar.gz
tar -zxvf dbench.tar.gz
pushd dbench
./autogen.sh
./configure
make
./dbench --loadfile=loadfiles/client.txt --backend=fileio -t 300 1
./dbench --loadfile=loadfiles/client.txt --backend=fileio -t 300 10
popd
