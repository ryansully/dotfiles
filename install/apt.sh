#!/usr/bin/env bash

sudo apt update && sudo apt upgrade

# install pip, pip3
sudo apt install git python-pip python3-pip

# install Source Code Pro font
FONT_HOME=~/.local/share/fonts
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git "$FONT_HOME/adobe-fonts/source-code-pro"
fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro"

sudo apt install fortune-mod fortunes-off