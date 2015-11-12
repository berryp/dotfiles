export SHELL=/usr/local/bin/zsh
export GOPATH=$HOME/work

export PATH=/usr/local/share:/usr/local/sbin:/usr/local/bin:$HOME/bin:$HOME/.rbenv/shims:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/work/bin:$PATH

# cd aliases.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias gist='gist -c -p -s'

alias grep='grep --exclude="*.egg/" --exclude="*.min.js"'

alias docker-clean='docker rm `docker ps --no-trunc -aq` && docker images -q --filter "dangling=true" | xargs docker rmi'

export GPG_TTY=`tty`

if [ -f "$HOME/.zsh_profile" ]; then
    . "$HOME/.zsh_profile"
fi

