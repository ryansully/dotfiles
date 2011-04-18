#!/bin/bash -e
echo "Setting up .bashrc..."
cp ~/.bashrc ~/.bashrc.backup
cat >> ~/.bashrc << EOF

. ~/.dotfiles/.bashrc
EOF

# source startup script immediately
. ~/.bashrc

# backup/symlink
echo "Setting up .gitconfig..."
[ -L ~/.gitconfig ] && rm ~/.gitconfig
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig.backup
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

echo "Installation complete!"
