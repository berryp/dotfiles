#!/bin/sh

files=$(find . -maxdepth 1 -type f -name ".*"  $(printf "! -name %s " .gitignore .gitmodules))

mkdir -p tmp

echo "--- Linking dotfiles ---"
for file in $files; do
    f=${file#./}
    echo "Backing up $f."
    mv ~/$f tmp/
    echo "Linking $f."
    ln -s ~/.dotfiles/$f ~/$f
done

echo "--- Installing OhMyZSH ---"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "--- Installing vim-plug ---"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "--- Installing tmux plugin manager ---"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
