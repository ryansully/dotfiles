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

# Fix SSH auth socket location so agent forwarding works with tmux and VS Code
export SSH_AUTH_SOCK=$HOME/.ssh/auth_sock

# Homebrew
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# MacPorts
[[ -r "/opt/local/etc/profile.d/bash_completion.sh" ]] && . "/opt/local/etc/profile.d/bash_completion.sh"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Ruby
[ `which rbenv` ] && eval "$(rbenv init -)"

[ `which colorls` ] && source $(dirname $(gem which colorls))/tab_complete.sh

[ `which fastfetch` ] && fastfetch

[ `which fortune` ] && [ `which lolcat` ] && fortune | lolcat # :)
