#!/usr/bin/env bash

# Ubuntu: find and uncomment the following line in ~/.bashrc:
#force_color_prompt=yes

bashrc() {
    . $BASH_SOURCE
}
me=`readlink -f $0`
here=`dirname $BASH_SOURCE`

# Bash settings
[ -f $here/bash/aliases ] && . $here/bash/aliases
[ -f $here/bash/colors ] && . $here/bash/colors
[ -f $here/bash/paths ] && . $here/bash/paths
[ -f $here/bash/prompts ] && . $here/bash/prompts

unset me
unset here

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

/usr/games/fortune # :)
