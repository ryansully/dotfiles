#!/usr/bin/env bash

# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off

# upgrade Bash
brew update && brew install bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash

# Homebrew will also install Setuptools, pip, pip3
brew install git python python3

# install Vim with Python 3 support
brew remove vim
brew cleanup
brew install vim --with-python3

# install Cask
brew tap caskroom/cask

# install Source Code Pro font
brew tap caskroom/fonts
brew cask install font-source-code-pro

# install other packages
brew install ripgrep
brew install tmux
brew install unar
brew install watchman # https://github.com/facebook/jest/issues/1767
brew cask install dropbox
brew cask install google-chrome
brew cask install slack
brew cask install virtualbox
brew cask install visual-studio-code

brew install ffmpeg
brew install youtube-dl

brew install dockutil

brew install fortune
