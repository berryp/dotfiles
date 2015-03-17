#!/bin/sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

alias activate='. env/bin/activate'

# -n line numbers, -G basic regex, -I ignore binary, -i ignore case.
# -B lines before, -A lines after , -C lines before and after.
alias grep='grep --color=auto -n --exclude="*.orig,*.swp,env,.hg,.git" -I'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias serve='thin -R $HOME/www/serve.ru start'

alias gist="jist -o -c"

alias go='GOPATH=$PWD go'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip-downloads
export MACOSX_DEPLOYMENT_TARGET=10.9
export CFLAGS=-I/brew/include
export JAVA_HOME=/Library/Java/Home # $(/usr/libexec/java_home)

export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# Android development
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROIDSDK=$ANDROID_HOME
export ANDROIDAPI=22

export VIRTUALENV_DISTRIBUTE=1

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/bin:/usr/local/share:$PATH
export PATH=/Users/berryp/projects/incubator-cordova-android/bin:$PATH
export PATH=/Users/berryp/node_modules/.bin:$PATH

export EDITOR=vim
export LESS=gi

export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export BLOCKSIZE=K


### Tool defaults

GREP_OPTIONS=""
for pattern in .cvs .git .hg .svn env node_modules; do
  GREP_OPTIONS="$GREP_OPTIONS --exclude-dir=$pattern"
done
export GREP_OPTIONS

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  . $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Prompt Colors
# Modified version of @gf3’s Sexy Bash Prompt
# (https://github.com/gf3/dotfiles)
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    BLACK=$(tput setaf 190)
    MAGENTA=$(tput setaf 9)
    ORANGE=$(tput setaf 172)
    GREEN=$(tput setaf 190)
    PURPLE=$(tput setaf 141)
    WHITE=$(tput setaf 0)
  else
    BLACK=$(tput setaf 190)
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  BLACK="\033[01;30m"
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

export BLACK
export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

# Change this symbol to something sweet.
# (http://en.wikipedia.org/wiki/Unicode_symbols)
# symbol="⚡ "
# ⚡ ➠ ⌘ ➜ → ☞ ☠ ☢ ► ▸ ● ✳ ✶ ✷ ○
command_symbol="⌘ "
dirty_symbol="✳"

function vcs_prompt() {
  vcprompt -f "[%n:%b%m%u]"
}

# export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(vcs_prompt) ]] && echo \" on \")\[$PURPLE\]\$(vcs_prompt)\[$WHITE\]\n$command_symbol\[$RESET\] "
export PS1="\[$GREEN\]\w\[$WHITE\]\$([[ -n \$(vcs_prompt) ]] && echo \" on \")\[$PURPLE\]\$(vcs_prompt)\[$WHITE\] $command_symbol\[$RESET\] "
# export PS1="\[$GREEN\]\w\[$WHITE\] $ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

### Misc

# Only show the current directory's name in the tab
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'

### Finally

# Load local settings.

if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

