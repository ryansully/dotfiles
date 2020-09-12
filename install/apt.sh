#!/usr/bin/env bash

UBUNTU_VERSION=$(lsb_release -rs)

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo apt update && sudo apt upgrade

[ `which snap` ] || (sudo apt update && sudo apt install snapd)

# install ripgrep
if (( `echo "$UBUNTU_VERSION < 18.10" | bc` )); then
  # Ubuntu Trusty, Xenial, Bionic
  # https://github.com/x4121/ripgrep-ubuntu#pre-build
  sudo add-apt-repository ppa:x4121/ripgrep && sudo apt update
fi

# neofetch
if (( `echo "$UBUNTU_VERSION <= 16.10" | bc` )); then
  # Ubuntu 16.10 and below needs PPA
  # https://github.com/dylanaraps/neofetch/wiki/Installation#ubuntu-1610-and-below
  sudo add-apt-repository ppa:dawidd0811/neofetch && sudo apt update
fi

# dpkg --get-selections > apt-packages.txt
sudo apt update && xargs -a apt-packages.txt sudo apt install

# install desktop packages
[ `dpkg -l ubuntu-desktop` ] && ./apt-desktop.sh
