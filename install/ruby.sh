#!/usr/bin/env bash

# install rbenv
if [ ! `which rbenv` ]; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
  . ~/.bashrc
fi

# Install latest (stable) Ruby
ruby_latest=$(rbenv install -l 2>/dev/null | awk '$1 ~ /^[0-9.]*$/ {latest=$1} END {print latest}')
if [ $ruby_latest != `rbenv version | awk '{print $1;}'` ]; then
  if [ `uname` = 'Linux' ]; then
    sudo apt-get install -y libssl-dev
  fi

  rbenv install $ruby_latest
  rbenv global $ruby_latest
  rbenv rehash
fi

# Install gems from Gemfile
gem install bundler
rbenv rehash
bundle install --gemfile=~/.dotfiles/install/Gemfile --system
rbenv rehash
