#!/usr/bin/env bash

set -e

wget  http://172.30.14.127/pjdfstest.tar.gz
tar -zxvf pjdfstest.tar.gz
cd pjdfstest
autoreconf -ifs
./configure
make pjdfstest
mkdir tmp
cd tmp
# must be root!
sudo prove -r -v --exec 'bash -x' ../tests
cd ..
sudo rm -rf tmp
