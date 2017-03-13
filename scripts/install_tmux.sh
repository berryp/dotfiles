#!/bin/sh

cd $1
sh autogen.sh
./configure
make
sudo make install

# If OS X
# https://robots.thoughtbot.com/tmux-copy-paste-on-os-x-a-better-future
