#!/usr/bin/env bash

tstamp=`date +%Y%m%d%H%M%S`

# install packages
case `uname` in
    "Linux")
        . ./install/apt.sh
        ;;
    "Darwin")
        . ./install/brew.sh
        ;;
esac

[ `which pip3` ] && sudo pip3 install -r pip/requirements.txt
[ `which pip3` ] && pip3 install --user -r pip/requirements-user.txt
[ `which gem` ] && sudo gem install lolcat
[ `which gem` ] && sudo gem install colorls

# .tmux
git clone https://github.com/gpakosz/.tmux.git ~/.tmux
ln -s -f "$HOME/.tmux/.tmux.conf" "$HOME"

# Base16 Shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

echo "Setting up .bashrc..."
# backup original file
cp -v ~/.bashrc ~/.bashrc.backup.$tstamp

# append source command
cat >> ~/.bashrc << EOF

. ~/.dotfiles/.bashrc
EOF

echo "Setting up .bash_profile..."
# backup original file
cp -v ~/.bash_profile ~/.bash_profile.backup.$tstamp

# append source command
cat >> ~/.bash_profile << EOF

. ~/.bashrc
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
setup_symlink ".gitignore_global" "$HOME"
setup_symlink ".npmrc" "$HOME"
setup_symlink ".scss-lint.yml" "$HOME"
setup_symlink ".tmux.conf.local" "$HOME"
setup_symlink ".vim" "$HOME"
setup_symlink ".vimrc" "$HOME"
setup_symlink "neofetch" "$HOME/.config"
setup_symlink "powerline" "$HOME/.config"
setup_symlink "ssh/rc" "$HOME/.ssh"

# symlink Sublime Text
case `uname` in
    "Linux")
        setup_symlink "sublime-text-3/User" "$HOME/.config/sublime-text-3/Packages"
        ;;
    "Darwin")
        setup_symlink "sublime-text-3/User" "$HOME/Library/Application Support/Sublime Text 3/Packages"
        ;;
esac

echo "Installation complete!"
echo "Restart your terminal to enjoy!"
