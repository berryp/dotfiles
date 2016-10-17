#!/bin/sh

cd $1
sh autogen.sh
./configure
make
sudo make install
