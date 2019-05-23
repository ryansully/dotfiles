#!/usr/bin/env bash

# Snap is already installed in Ubuntu 16.04+ ("Xenial"), but just in case...
# https://docs.snapcraft.io/installing-snap-on-ubuntu/6740
[ `which snap` ] || (sudo apt update && sudo apt install snapd)

# Android Studio
# https://snapcraft.io/android-studio
sudo snap install android-studio

# Discord
# https://snapcraft.io/discord
sudo snap install discord

# Google Play Music Desktop Player
# https://snapcraft.io/google-play-music-desktop-player
# sudo snap install google-play-music-desktop-player --edge

# Hyper
# https://snapcraft.io/hyper
sudo snap install hyper --classic

# OBS Studio
# https://snapcraft.io/obs-studio
# https://github.com/obsproject/obs-studio/wiki/Install-Instructions#snappy-installation-unofficial
# sudo snap install obs-studio

# Slack
# https://snapcraft.io/slack
sudo snap install slack

# Spotify
# https://snapcraft.io/spotify
# sudo snap install spotify

# Sublime Text
# https://snapcraft.io/sublime-text
# sudo snap install sublime-text --classic

# Telegram
# https://snapcraft.io/telegram-desktop
sudo snap install telegram-desktop

# Visual Studio Code
# https://snapcraft.io/code
# sudo snap install code --classic
# sudo snap install code-insiders --classic

# VLC
# https://snapcraft.io/vlc
sudo snap install vlc
