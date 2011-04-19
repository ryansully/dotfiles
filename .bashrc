bashrc() {
    . $BASH_SOURCE
}
me=`readlink -f $0`
here=`dirname $BASH_SOURCE`
[ -f $here/bash/aliases ] && . $here/bash/aliases
[ -f $here/bash/prompts ] && . $here/bash/prompts
[ -d $HOME/bin ] && PATH="$HOME/bin:$PATH"
fortune # :)
