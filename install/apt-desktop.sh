#!/usr/bin/env bash

sudo apt update && sudo apt upgrade

# install FiraCode font
sudo apt install fonts-firacode

FONT_HOME=$HOME/.local/share/fonts
mkdir -p "$FONT_HOME"
firacode_nerd_fonts=(
  Bold/complete/Fura%20Code%20Bold%20Nerd%20Font%20Complete.otf
  Light/complete/Fura%20Code%20Light%20Nerd%20Font%20Complete.otf
  Medium/complete/Fura%20Code%20Medium%20Nerd%20Font%20Complete.otf
  Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete.otf
  Retina/complete/Fura%20Code%20Retina%20Nerd%20Font%20Complete.otf
)

for font in "${firacode_nerd_fonts[@]}"; do
  wget "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/$font" -P "$FONT_HOME"
done

# install Source Code Pro font
sudo apt install git
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git "$FONT_HOME/adobe-fonts/source-code-pro"

# rebuild font cache
fc-cache -f -v "$FONT_HOME"

# Firefox
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo apt-get update && sudo apt-get install firefox

# Google Chrome
# https://www.google.com/linuxrepositories/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

# Google Play Music Desktop Player
# https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/blob/master/docs/Installation_On_Debian.md
wget -qO - https://gpmdp.xyz/bintray-public.key.asc | sudo apt-key add -
echo "deb https://dl.bintray.com/marshallofsound/deb debian main" | sudo tee -a /etc/apt/sources.list.d/gpmdp.list
sudo apt-get update
sudo apt-get install google-play-music-desktop-player

# Mixxx
sudo add-apt-repository ppa:mixxx/mixxx
sudo apt-get update && sudo apt-get install mixxx

# OBS Studio
# https://github.com/obsproject/obs-studio/wiki/Install-Instructions#ubuntu-installation
sudo apt-get install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get update
sudo apt-get install obs-studio
sudo apt-get install libq5webkit5-dev # for browser plugin

# Spotify
# https://www.spotify.com/us/download/linux/
# snap install spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

# Sublime Text
# https://www.sublimetext.com/docs/3/linux_repositories.html#apt
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Visual Studio Code
# https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code code-insiders

# VirtualBox
# https://www.virtualbox.org/wiki/Linux_Downloads
echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - # Ubuntu 16.04+ ("Xenial")
# wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - # for older distributions
sudo apt-get update
sudo apt-get install virtualbox-6.0
# to use USB devices from VirtualBox guests
# (active user must log out and back in again)
sudo usermod -a -G vboxusers $USER

# ievms
# http://xdissent.github.io/ievms/
sudo apt-get install unar
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | env IEVMS_VERSIONS="EDGE" bash

./snap.sh
