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

alias vim="`which nvim`"

# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias _pycleanjunk='find . -name '\''*.pyc'\'' -or -name '\''*.orig'\'' -or -name '\''*.swp'\'' -or -name '\''*.swo'\'' -or -name '\''*.log'\'' -or -name Pyro_log -or -name '\''*.egg-info'\'' | xargs rm -vRf'

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias gist='gist -c -p -s'

alias grep='grep --exclude="*.egg/" --exclude="*.min.js"'

alias flushdns="sudo dscacheutil -flushcache"
alias upcheese='python setup.py register -r cheese sdist upload -r cheese'
alias t='todo.sh '
alias activate='. env/bin/activate'

alias docker-clean='docker rm `docker ps --no-trunc -aq` && docker images -q --filter "dangling=true" | xargs docker rmi'

export GPG_TTY=`tty`

if [ -f "$HOME/.zsh_profile" ]; then
    . "$HOME/.zsh_profile"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
