#!/bin/sh

echo "--- Updating system ---"
sudo pacman --noconfirm -Syu

echo "--- Installing packages ---"
sudo pacman --noconfirm --needed -S xsel neovim fzf go go-tools

echo "--- Configuring environment ---"
chsh -s /usr/bin/zsh

export DOTFILES=$PWD
export HOME=/home/vagrant

files=$(find . -maxdepth 1 -type f -name ".*"  $(printf "! -name %s " .gitignore .gitmodules))

echo "--- Linking dotfiles ---"
for file in $files; do
    f=${file#./}
    echo "Linking $f."
    echo $f $HOME/$f
    rm $HOME/$f
    ln -s $PWD/$f $HOME/$f
done

echo "--- Installing OhMyZSH ---"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "--- Setting up Neovim ---"
mkdir -p $HOME/config/nvim
ln -s $HOME/.vim $HOME/.config/nvim
ln -s /usr/local/bin/vi /usr/bin/nvim

echo "--- Installing vim-plug ---"
curl -fsLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "--- Installing tmux plugin manager ---"
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "--- Installing base16-shell ---"
git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell

