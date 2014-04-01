export PATH=/usr/local/share:/usr/local/sbin:/usr/local/bin:$HOME/bin:$HOME/.rbenv/shims:$PATH
export EDITOR=vim

alias wo='workon '

# cd aliases.
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias v="mvim --remote-tab-silent "
alias _pycleanjunk='find . -name '\''*.pyc'\'' -or -name '\''*.orig'\'' -or -name '\''*.swp'\'' -or -name '\''*.swo'\'' -or -name '\''*.log'\'' -or -name Pyro_log -or -name '\''*.egg-info'\'' | xargs rm -vRf'

alias gist='gist -c -p -s'

alias flushdns="sudo dscacheutil -flushcache"
alias upcheese='python setup.py register -r cheese sdist upload -r cheese'
alias t='todo.sh '
alias activate='. env/bin/activate'

export VIRTUALENVWRAPPER_PYTHON=`which python`
export VIRTUALENV_DISTRIBUTE=1
export WORKON_HOME=$HOME/work/.envs
source `which virtualenvwrapper.sh`
 
