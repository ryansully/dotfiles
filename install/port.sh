#!/usr/bin/env bash

# check if MacPorts is installed
if [ ! `which port` ]; then
  echo "Error: Install MacPorts not found. Downloading installation package..."
  curl -O https://github.com/macports/macports-base/releases/download/v2.12.6/MacPorts-2.12.6-26-Tahoe.pkg
  exit 1
fi

# Upgrade MacPorts itself and run the sync target
# (update the local ports tree with the global MacPorts ports repository)
sudo port -v selfupdate

if [ `which bash` = '/bin/bash' ]; then
  # upgrade Bash
  sudo port install bash
  sudo bash -c 'echo /opt/local/bin/bash >> /etc/shells'
  chsh -s /opt/local/bin/bash
fi

# Specify multiple package names from a file for a single install command
#   this results in faster execution, because scanning of binaries for linking
#   errors occurs upon completion of each install command
grep -v '^#' ~/.dotfiles/install/port-packages.txt | xargs | sed 's/^/install /' | sudo port

# generate a list of ports that have newer versions available
port outdated

# upgrade installed ports and their dependencies to the latest version available
sudo port upgrade outdated

# get a list of inactive ports you likely no longer need
port installed inactive
