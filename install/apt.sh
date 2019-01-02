#!/usr/bin/env bash

sudo apt update && sudo apt upgrade

# install pip, pip3
sudo apt install git python-pip python3-pip

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
mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git "$FONT_HOME/adobe-fonts/source-code-pro"

# rebuild font cache
fc-cache -f -v "$FONT_HOME"

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
