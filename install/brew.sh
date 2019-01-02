#!/usr/bin/env bash

# install Homebrew
[ `which brew` ] || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Turn off Homebrew’s analytics.
brew analytics off

if [ `which bash` = '/bin/bash' ]; then
  # upgrade Bash
  brew update && brew install bash
  sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
  chsh -s /usr/local/bin/bash
fi

# Install Homebrew Bundle
brew tap Homebrew/bundle

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we are using the latest Homebrew
brew update

# Upgrade existing packages
brew upgrade

# Install CLI tools & GUI applications
brew bundle --file=~/.dotfiles/install/Brewfile

# Remove outdated versions from the cellar including casks
brew cleanup && brew prune
