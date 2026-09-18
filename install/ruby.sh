#!/usr/bin/env bash

# install rbenv
if [ ! `which rbenv` ]; then
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
  . ~/.bashrc
fi

# Install latest (stable) Ruby
rbenv install 4
rbenv global 4

# Install gems from Gemfile
gem install bundler
bundle config set path.system true
bundle install --gemfile=~/.dotfiles/install/Gemfile
