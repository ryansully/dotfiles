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

# EC2 settings
[ -f $HOME/.ec2/.bashrc ] && . $HOME/.ec2/.bashrc

# ignoredups:  causes lines matching the previous history entry to not be saved
# ignorespace: lines which begin with a space character are not saved in the
#              history list
# ignoreboth
HISTCONTROL=ignoreboth

# 256 colors in terminal
export TERM='xterm-256color'

/usr/games/fortune # :)
