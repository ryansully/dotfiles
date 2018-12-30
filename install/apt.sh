#!/usr/bin/env bash

sudo apt update && sudo apt upgrade

# install pip, pip3
sudo apt install git python-pip python3-pip

# install FiraCode font
sudo apt install fonts-firacode

# install Source Code Pro font
FONT_HOME=~/.local/share/fonts
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git "$FONT_HOME/adobe-fonts/source-code-pro"
fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro"

sudo apt install tmux

# install ripgrep
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt-get install ripgrep

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

# Visual Studio Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders

# neofetch
# sudo add-apt-repository ppa:dawidd0811/neofetch && sudo apt update # 16.10 and below
sudo apt install neofetch

sudo apt install fortune-mod fortunes-off
