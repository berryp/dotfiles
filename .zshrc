# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sorin"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vi'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export SHELL='/usr/local/bin/zsh'
export SHELL=`which zsh`
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

function addkeys {
  ssh-add ~/.ssh/nap-dev.pem
  ssh-add ~/.ssh/nap-live.pem
}

alias agrep="grep --color=auto -nr -A 2 -B 2"
