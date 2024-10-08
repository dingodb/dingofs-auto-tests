#!/usr/bin/env bash

set -e

wget -O linux.tar.gz http://172.30.14.127/linux-5.4.tar.gz
#sudo apt-get install libelf-dev bc -y
sudo yum install bc -y
mkdir t
cd t
tar xzf ../linux.tar.gz
cd linux*
make defconfig
make -j`grep -c processor /proc/cpuinfo`
cd ..
if ! rm -rv linux* ; then
    echo "uh oh rm -r failed, it left behind:"
    find .
    exit 1
fi
cd ..
rm -rv t linux*
