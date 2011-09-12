bashrc() {
    . $BASH_SOURCE
}
me=`readlink -f $0`
here=`dirname $BASH_SOURCE`
[ -f $here/bash/aliases ] && . $here/bash/aliases
[ -f $here/bash/prompts ] && . $here/bash/prompts
unset me
unset here
[ -f $HOME/.ec2/.bashrc ] && . $HOME/.ec2/.bashrc
[ -d $HOME/bin ] && PATH="$HOME/bin:$PATH"

# ignoredups:  causes lines matching the previous history entry to not be saved
# ignorespace: lines which begin with a space character are not saved in the
#              history list
HISTCONTROL=ignoredups:ignorespace

fortune # :)
