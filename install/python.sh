#!/usr/bin/env bash

# install pyenv
if [ `which pyenv` ]; then
  pyenv update
else
  curl https://pyenv.run | bash
  . ~/.bashrc
fi

# Install latest (stable) Python
python2_latest=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^2[0-9.]*$/ {latest=$1} END {print latest}')
python_latest=$(pyenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
if [ $python2_latest != `pyenv version | awk '{print $1;}'` ]; then
  if [ `uname` = 'Linux' ]; then
    sudo apt-get install -y libssl-dev
  fi

  pyenv install --skip-existing $python2_latest
  pyenv install --skip-existing $python_latest
  pyenv rehash
  pyenv global $python2_latest
fi
