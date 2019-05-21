#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export EDITOR='vim'

HIST_STAMPS='yyyy-mm-dd'
export HISTTIMEFORMAT='-i '

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
alias asjson='python -m json.tool'
alias server='python3 -m http.server'

alias vi=nvim
alias vim=nvim

alias h=hyper
alias kc=kubectl
alias kx=kubectx
alias e=code
alias edit=code
alias c=code
alias download=aria2c

alias venv="pyenv virtualenv ${PWD##*/}"
alias activate="pyenv activate ${PWD##*/}"

export GPG_TTY=`tty`

# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
# # Set the theme
# base16_tomorrow-night

# source $HOME/opt/google-cloud-sdk/path.zsh.inc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U colors; colors
source $HOME/.zprezto-contrib/zsh-kubectl-prompt/kubectl.zsh
source <(kubectl completion zsh)

RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

# export PYENV_ROOT=/usr/local/opt/pyenv
eval "$(pyenv init -)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
eval "$(pyenv init -)"

