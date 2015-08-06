#alias ls='ls -hGF'
#alias ll='ls -lGF'
#alias la='ls -AGF'
#alias l='ls -CFGF'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

alias activate='. env/bin/activate'

# alias vim="/usr/local/opt/macvim/MacVim.app/Contents/MacOS/Vim"

# Git
# You must install Git first - ""
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'

# -n line numbers, -G basic regex, -I ignore binary, -i ignore case.
# -B lines before, -A lines after , -C lines before and after.
alias grep='grep --color=auto -n --exclude="*.orig,*.swp,env,.hg,.git" -I'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias serve='thin -R $HOME/www/serve.ru start'

alias gist="jist -o -c"

alias yghammer='killall -9 postgres ; killall -9 mongod ; killall -9 python'

alias go='GOPATH=$PWD go'

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Colored up cat!
# You must install Pygments first - "sudo easy_install Pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

alias timecurl='curl -o /dev/null -s -w "%{time_total}\\n" '
