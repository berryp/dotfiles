# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sorin"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR='vi'

export GOPATH=$HOME/work
export GO15VENDOREXPERIMENT=1

export PATH=/usr/local/share:/usr/local/sbin:/usr/local/bin:$HOME/bin:$HOME/.rbenv/shims:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/work/bin:/usr/local/go/bin:$PATH
export PATH=/Users/b.phillips/Library/Python/2.7/bin:$PATH


# cd aliases.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias gist='gist -c -p -s'
alias grep='grep --exclude="*.egg/" --exclude="*.min.js"'
alias agrep="grep --color=auto -nr -A 2 -B 2"

alias docker-clean='docker rm `docker ps --no-trunc -aq` && docker images -q --filter "dangling=true" | xargs docker rmi'

export GPG_TTY=`tty`

if [ -f "$HOME/.zsh_profile" ]; then
    . "$HOME/.zsh_profile"
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# Set the theme
base16_default-dark

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function dock {
  docker-machine start local
  eval $(docker-machine env local)
}

source $HOME/.oh-my-zsh/plugins/z/z.sh
