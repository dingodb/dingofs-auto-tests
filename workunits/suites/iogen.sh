#!/usr/bin/env bash
set -e

echo "getting iogen"
git clone https://github.com/shmimura/iogen.git
cd iogen
echo "making iogen"
make
echo "running iogen"
./iogen -n 5 -s 2g
echo "sleep for 10 min"
sleep 600
echo "stopping iogen"
./iogen -k

echo "OK"
