#!/usr/bin/env bash

# install pyenv
if [ `which pyenv` ]; then
  pyenv update
else
  curl -fsSL https://pyenv.run | bash
  . ~/.bashrc
fi

# Install latest (stable) Python
pyenv install 3
pyenv global 3

# Install global packages from requirements files
[ `which pip3` ] && sudo pip3 install -r ~/.dotfiles/pip/requirements.txt
[ `which pip3` ] && pip3 install --user -r ~/.dotfiles/pip/requirements-user.txt
