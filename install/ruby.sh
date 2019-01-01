#!/usr/bin/env bash

# Install gems from Gemfile
gem install bundler
bundle install --gemfile=Gemfile --system
