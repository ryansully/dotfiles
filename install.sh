#!/bin/bash -e
tstamp=`date +%Y%m%d%H%M%S`

echo "Setting up .bashrc..."
# backup original file
echo cp -v ~/.bashrc ~/.bashrc.backup.$tstamp
# append source command
cat >> ~/.bashrc << EOF

. ~/.dotfiles/.bashrc
EOF

# source startup script immediately
. ~/.bashrc

echo "Setting up .gitconfig..."
# rename symlink or original file
[ -L ~/.gitconfig ] || [ -f ~/.gitconfig ] && echo mv -v ~/.gitconfig ~/.gitconfig.backup.$tstamp
# make new symlink
ln -sv ~/.dotfiles/.gitconfig ~/.gitconfig

echo "Installation complete!"
