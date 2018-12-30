#!/usr/bin/env bash

# Ubuntu: find and uncomment the following line in ~/.bashrc:
#force_color_prompt=yes

# Bash settings
[ -f ~/.dotfiles/bash/aliases ] && . ~/.dotfiles/bash/aliases
[ -f ~/.dotfiles/bash/colors ] && . ~/.dotfiles/bash/colors
[ -f ~/.dotfiles/bash/paths ] && . ~/.dotfiles/bash/paths
[ -f ~/.dotfiles/bash/prompts ] && . ~/.dotfiles/bash/prompts

# ignoredups:  causes lines matching the previous history entry to not be saved
# ignorespace: lines which begin with a space character are not saved in the
#              history list
# ignoreboth
HISTCONTROL=ignoreboth

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# 256 colors in terminal
export TERM='xterm-256color'

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects
    source /usr/local/bin/virtualenvwrapper.sh
fi

source $(dirname $(gem which colorls))/tab_complete.sh

NEOFETCH_ASCII=`[ -f $HOME/.config/neofetch/ascii.local ] && echo "--ascii $HOME/.config/neofetch/ascii.local"`
[ `which neofetch` ] && neofetch $NEOFETCH_ASCII

[ `which fortune` ] && [ `which lolcat` ] && fortune | lolcat # :)
