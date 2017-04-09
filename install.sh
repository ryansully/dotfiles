#!/usr/bin/env bash -e

tstamp=`date +%Y%m%d%H%M%S`

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git python-pip python3-pip

[ `which pip3` ] && sudo pip3 install -r pip/requirements.txt
[ `which pip3` ] && pip3 install --user -r pip/requirements-user.txt

# install Source Code Pro font
if [ `which git` ]; then
    FONT_HOME=~/.local/share/fonts
    mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
    git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git "$FONT_HOME/adobe-fonts/source-code-pro"
    fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro"
fi

echo "Setting up .bashrc..."
# backup original file
cp -v ~/.bashrc ~/.bashrc.backup.$tstamp

# append source command
cat >> ~/.bashrc << EOF

. ~/.dotfiles/.bashrc
EOF

# source startup script immediately
. ~/.bashrc

# append source command
cat >> ~/.bash_profile << EOF

[ -f ~/.dotfiles/bash/paths ] && . ~/.dotfiles/bash/paths
EOF

# npm
npm adduser

echo "Setting up symlinks..."
setup_symlink() {
    mkdir -p "$2"
    local link="$2/`basename $1`"
    # backup original file/directory/symlink
    [ -e "$link" ] && mv -v "$link" "$link.backup.$tstamp"
    # create new symlink
    ln -sv "$HOME/.dotfiles/$1" "$2"
}
setup_symlink ".gitconfig" "$HOME"
setup_symlink ".npmrc" "$HOME"
setup_symlink ".scss-lint.yml" "$HOME"
setup_symlink ".vim" "$HOME"
setup_symlink ".vimrc" "$HOME"
setup_symlink "powerline" "$HOME/.config"
setup_symlink "sublime-text-2/User" "$HOME/.config/sublime-text-2/Packages"
setup_symlink "sublime-text-3/User" "$HOME/.config/sublime-text-3/Packages"

echo "Installation complete!"
