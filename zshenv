export GOPATH=$HOME/work

export PATH=/usr/local/share:/usr/local/sbin:/usr/local/bin:$HOME/bin:$HOME/.rbenv/shims:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

alias wo='workon '

# cd aliases.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias v="mvim --remote-tab-silent "
alias _pycleanjunk='find . -name '\''*.pyc'\'' -or -name '\''*.orig'\'' -or -name '\''*.swp'\'' -or -name '\''*.swo'\'' -or -name '\''*.log'\'' -or -name Pyro_log -or -name '\''*.egg-info'\'' | xargs rm -vRf'

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias gist='gist -c -p -s'

alias grep='grep --exclude="*.egg/" --exclude="*.min.js"'

alias flushdns="sudo dscacheutil -flushcache"
alias upcheese='python setup.py register -r cheese sdist upload -r cheese'
alias t='todo.sh '
alias activate='. env/bin/activate'

alias yghammer='killall -9 postgres ; killall -9 mongod ; killall -9 python'

export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENV_DISTRIBUTE=1
export WORKON_HOME=$HOME/work/.envs
source `which virtualenvwrapper.sh`

export DOCKER_HOST=tcp://127.0.0.1:4243
GOROOT=/usr/local/opt/go/libexec

alias goapp=~/google-cloud-sdk/platform/google_appengine/goapp

# The next line updates PATH for the Google Cloud SDK.
source '/Users/berryp/google-cloud-sdk/path.zsh.inc'

alias s='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

export GIT_EDITOR="vim --wait --new-window"

export GPG_TTY=`tty`
