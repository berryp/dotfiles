#!/bin/sh

echo "--- Updating system ---"
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
sudo apt-get update

# Docker
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "--- Installing packages ---"
sudo apt-get install -y \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  xsel \
  neovim \
  golang \
  zip \
  tree \
  zsh \
  curl \
  docker-engine

echo "--- Configuring environment ---"
chsh -s /usr/bin/zsh

export DOTFILES=$PWD

files=$(find . -maxdepth 1 -type f -name ".*"  $(printf "! -name %s " .gitignore .gitmodules))

echo "--- Installing FZF ---"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "--- Installing OhMyZSH ---"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "--- Setting up Neovim ---"
mkdir -p $HOME/config/nvim
ln -s $HOME/.vim $HOME/.config/nvim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

echo "--- Installing vim-plug ---"
curl -fsLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "--- Installing tmux plugin manager ---"
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

echo "--- Installing base16-shell ---"
git clone https://github.com/chriskempson/base16-shell.git $HOME/.config/base16-shell

echo "--- Linking dotfiles ---"
for file in $files; do
    f=${file#./}
    echo "Linking $f."
    echo $f $HOME/$f
    rm $HOME/$f
    ln -s $PWD/$f $HOME/$f
done

